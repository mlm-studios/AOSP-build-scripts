
rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/accupara/los22.git -b lineage-22.0 --git-lfs --depth=1 
 mkdir -p .repo/local_manifests && rm -rf .repo/local_manifests/* || true && curl -o .repo/local_manifests/local_manifest.xml https://raw.githubusercontent.com/AsTechpro20/local_manifests_blossom/refs/heads/lineage-22/local_manifests.xml && 
# Sync the repositories
if [ -f /usr/bin/resync ]
 then
  /usr/bin/resync # For compatibility with Omansh's Docker image 
else
  /opt/crave/resync.sh
fi && 
# Set up build environment
export BUILD_USERNAME=mlm-studios 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh && 
echo Repository: mlm-studios/crave_aosp_builder
echo Run ID: 1213214235
 
# Build the ROM
breakfast blossom userdebug && make installclean && mka bacon
