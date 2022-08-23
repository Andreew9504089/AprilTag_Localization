#!/usr/bin/env python2
 
import yaml

# convert the format of Tagslam's output, poses.yaml, to Apriltag Detection's format, tag.yaml.
class formatConverter():
    def __init__(self,downwardPath, output):
        self.path = downwardPath
        self.outputPath = output
        self.downward_bundle = {'name': 'tag_bundles_downward',
                                'layout': [],
                                'center': [{'x': 0,
                                            'y': 0,
                                            'z': 0,
                                            'qw': 1.0,
                                            'qx': 0,
                                            'qy': 0,
                                            'qz': 0}]
                                }
        self.tags_list = ''
        self.tagDict = {'standalone_tags': [],
                        'tag_bundles': []}

    def readYaml(self):
        with open(self.path) as f:
            data = yaml.load(f)
            self.tags_list = data['bodies'][0]['test_room']['tags']

    def writeYaml(self):
        with open(self.outputPath, 'w') as f:
            yaml.dump(self.tagDict, f, default_flow_style=True)

    def loadDownwardTags(self):
        self.readYaml()
        for dct in self.tags_list:
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
            self.downward_bundle['layout'].append(tag)
    
        self.tagDict['tag_bundles'].append(self.downward_bundle)

    def loadForwardBundles(self):
        pass

    def dump(self):
        self.loadDownwardTags()
        self.writeYaml()
                       
    def printTagList(self):
        self.readYaml()
        for dct in self.tags_list:
            x = dct['pose']['position']['x']
            y = dct['pose']['position']['y']
            z = dct['pose']['position']['z']
            id = dct['id']
            print(id, x, y, z)


if __name__ == "__main__":
    converter = formatConverter(downwardPath = 'poses.yaml', output = 'tags.yaml')
    converter.dump()