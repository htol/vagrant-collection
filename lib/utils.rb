
def nfs_under_windows(vm)
  if Vagrant::Util::Platform.windows? then
     unless Vagrant.has_plugin?("vagrant-winnfsd")
       raise  Vagrant::Errors::VagrantError.new, "vagrant-winnfsd plugin is missing. Please install it using 'vagrant plugin install vagrant-winnfsd' and rerun 'vagrant up'"
     end
  end

  vm.synced_folder ".", "/vagrant", :nfs => true,
                          :mount_options => [
                           'nfsvers=3',
                           'vers=3',
                           'actimeo=1',
                           'rsize=8192',
                           'wsize=8192',
                           'timeo=14',
                           :nolock,
                           :udp,
                           :intr,
                           :auto,
                           :exec,
                           :rw
                          ],
                          group: nil,
                          owner: nil

end