#!/usr/bin/env python2
 
from signal import pause
import yaml
    
# convert the format of Tagslam's output, poses.yaml, to Apriltag Detection's format, tag.yaml.
class formatConverter():
    def __init__(self,tagslamPath, output, forwardPath):
        self.tagslamPath = tagslamPath
        self.outputPath = output
        self.forwardPath = forwardPath
        self.downward_bundle = {'name': 'tag_bundles_downward',
                                'layout': []}
        self.forward_data = ''
        self.tag_data = ''
        self.forward_tags = []
        self.forward_tags_id = []
        
        self.tagDict = {'standalone_tags': [],
                        'tag_bundles': []}

    def readYaml(self):
        with open(self.tagslamPath) as f:
            self.tag_data = yaml.load(f) 

        with open(self.forwardPath) as f:
            self.forward_data = yaml.load(f)

        for dct in self.forward_data['tag_bundles']:
            self.forward_tags_id.append(dct['parent'])
            self.forward_tags_id.extend(dct['child'])

        self.tags = self.tag_data['bodies'][0]['test_room']['tags']

    def writeYaml(self):
        with open(self.outputPath, 'w') as f:
            yaml.dump(self.tagDict, f, default_flow_style=True)

    def loadTags(self):   
        for dct in self.tags:
                tag = {'id': 0,
                    'size': 0.3,
                    'x': 0,
                    'y': 0,
                    'z': 0,
                    'qw': 1.0,
                    'qx': 0,
                    'qy': 0,
                    'qz': 0}

                tag['id'] = dct['id']
                tag['size'] = dct['size']
                tag['x'] = dct['pose']['position']['x']
                tag['y'] = dct['pose']['position']['y']
                tag['z'] = dct['pose']['position']['z']
                tag['qx'] = dct['pose']['rotation']['x']
                tag['qy'] = dct['pose']['rotation']['y']
                tag['qz'] = dct['pose']['rotation']['z']

                if dct['id'] not in self.forward_tags_id:
                    self.downward_bundle['layout'].append(tag)
                else:
                    self.forward_tags.append(tag)
                
        self.tagDict['tag_bundles'].append(self.downward_bundle)

    def loadBundles(self):
        for bundle_info in self.forward_data['tag_bundles']:
            bundle = {'name': bundle_info['name'], 'layout': []}
            parent = next((item for item in self.forward_tags if item['id'] == bundle_info['parent']), False)

            if parent is False:
                print("Parent Tag ID: " + str(bundle_info["parent"]) + " Not Found in poses.yaml")

            else:
                for child_id in bundle_info['child']:
                    child = next((item for item in self.forward_tags if item['id'] == child_id), False)
                    if child is not False:
                        tag = {'id': 0,
                            'size': 0.3,
                            'x': 0,
                            'y': 0,
                            'z': 0,
                            'qw': 1.0,
                            'qx': 0,
                            'qy': 0,
                            'qz': 0}

                        tag['id'] = child['id']
                        tag['size'] = child['size']
                        tag['x'] = child['x'] - parent['x']
                        tag['y'] = child['y'] - parent['y']
                        tag['z'] = child['z'] - parent['z']
                        tag['qx'] = 0
                        tag['qy'] = 0
                        tag['qz'] = 0
                        bundle['layout'].append(tag)

                    else:
                        print("Child Tag ID: " + str(child_id) + " Not Found in poses.yaml")

                parent['x'] = 0
                parent['y'] = 0
                parent['z'] = 0
                parent['qx'] = 0
                parent['qy'] = 0
                parent['qz'] = 0
                bundle['layout'].append(parent)

            self.tagDict['tag_bundles'].append(bundle)



    def dump(self):
        self.readYaml()
        self.loadTags()
        self.loadBundles()
        self.writeYaml()
                       
    # def printTagList(self):
    #     self.readYaml()
    #     for dct in self.tags_list:
    #         x = dct['pose']['position']['x']
    #         y = dct['pose']['position']['y']
    #         z = dct['pose']['position']['z']
    #         id = dct['id']
    #         print(id, x, y, z)


if __name__ == "__main__":
    tagslamPath = 'poses.yaml'
    output = 'tags.yaml'
    forwardPath = 'tag_bundles.yaml'
    converter = formatConverter(tagslamPath = tagslamPath, output = output, forwardPath = forwardPath)
    converter.dump()