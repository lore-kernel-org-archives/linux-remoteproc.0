Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389D1C7287
	for <linux-remoteproc@vger.kernel.org>; Fri,  1 Nov 2024 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730475695; cv=none; b=WeYy6aGT+30QC60ldT4PRZHg/r87GpxR6ojZF+WbecXs3cmpb5pFntBRv9UIiTebGNJAKux2OK2yHT+HGKTTmrH4V5SKkGCI+o6gGbBsj8JquBvNWdHk9bmq4WN3pRy5171ODHxyjhO8miNi5bG1PowZhlbHMxYxFSy4jPa0buM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730475695; c=relaxed/simple;
	bh=l81s1O2CVjOizVFU2vWy/G2CTi8TdpNzU75RDHZbMNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNNUnF50kjRCOFKjbybNRP6MAf0PX+7l5jy18wezu0sVLiSM3useWmBGy3w/PSDEGxF1I0NqNbYRE7mDxnUgGC2HQuLrSHS7iN+79mrlYgCTSI3CotuxLh4zF/zua+sOv5tCSUEg7tJ1m+bwLlMhlKjLQ3vQj6Xha2c/a7TVIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhk9koWx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhk9koWx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-720c2db824eso1608889b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 Nov 2024 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730475689; x=1731080489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYyrfkpQInJbAL8t3lSVNfmqMNRffb1T48Q815iv3M4=;
        b=xhk9koWxiE1q8pJCLScyekjshxq+7CX5gNEMlcbHbOnDEum02QvRCIBN+B/Q9H+eLb
         R5e6zN43Bm2fPtMIKESWMdhI+3WzM6e1sET/YJFp7PxIoqi5jqDlQSSkcPom3GDim8hb
         Bqqemc7ICxV6rc6nVW7DDw5Euu4oR7gD0dgQx2Mhiwq1aghJ0UmeoTE4yIbllnDeDZXM
         DNjwQaUM0MITOxPQ2bQrXp60Qw4CMxrtSeEKFz8GfTypo2CtvSOqMWSOLkbevd1m0Q6O
         r55WnPPYgtOWSnh3eE54ZUUgEISUktKyNIHvQnC8MCHsrupespvuGgGNkFrmkpgxhAYt
         9cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730475689; x=1731080489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYyrfkpQInJbAL8t3lSVNfmqMNRffb1T48Q815iv3M4=;
        b=sg1uZbieb1bhWQoBOjztSkh79GTh1sF/Fyx/dNKhkS7+7Jx49knmMttG5QjmgT+f8Y
         3lIpunOyJtS7YVYuaX5IB737DjWDibKYYOaY8I5VdECUmgiA2mc5sf/Zi5XtZZ6uzAkE
         Fxnk5/3CTkvjSjE/SjApq5DOqEnSDSIzfCxpyNGwx/LOG0vgeXnlot6C7FD89TrOUyKq
         9dTXq+UktMI+7TOvbGgR6J7CfwA31Lj6dMlwViYC9X4u2nmqOU64dlFde6CzqvCVADuk
         iYfa6ohG0BaD707F6OeidRmNQStPR2gHSs+i3CJnhiW8cnnwVJsiVlSrEsfyxLzNnrV0
         sRmw==
X-Forwarded-Encrypted: i=1; AJvYcCXfBoyIqtzXJ49UYj4FdTvrpRQwmmo9drKSV8B9ha1GlvM2ouxnVsnmQ7WJT5KgeBkMKOMIlo65PAC63uaUAfQh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5LP5e5jUqz5vQudR7NwiitBEcumiNuuF8HQ6hlEi1r+UOrUf
	n1rSfcW3iW4SaJxFdk6RRoHMl14akjWU09t4krRAeVZohe3eciTs6bkW8DC/Rng=
X-Google-Smtp-Source: AGHT+IHCMo14Shzd6eJdh4nfkW704UIa186MozVayE40+jZGNxfWLNBAscn299jgYHWRQOBNp1nsKw==
X-Received: by 2002:a05:6a00:1881:b0:717:86e9:cc34 with SMTP id d2e1a72fcca58-72062fa17cfmr34748373b3a.8.1730475688926;
        Fri, 01 Nov 2024 08:41:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fd15:9e8:ec5f:6fa3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c4bbesm2778789b3a.114.2024.11.01.08.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:41:28 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:41:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: anish kumar <yesanishhere@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.orgi, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V5] remoteproc: Documentation: update with details
Message-ID: <ZyT2piU27MF28XcN@p14s>
References: <20241026212259.31950-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026212259.31950-1-yesanishhere@gmail.com>

On Sat, Oct 26, 2024 at 02:22:59PM -0700, anish kumar wrote:
> Added details as below:
> 1. added sysfs information
> 2. verbose details about remoteproc driver/framework
>    responsibilites.
> 3. example for resource request
> 
> Signed-off-by: anish kumar <yesanishhere@gmail.com>
> ---
> V5:
> based on comment from mathieu poirier, remove all files
> and combined that in the original file and as he adviced
> nothing with respect to old documentation was changed.
> 
> V4:
> Fixed compilation errors and moved documentation to
> driver-api directory.
> 
> V3:
> Seperated out the patches further to make the intention
> clear for each patch.
> 
> V2:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/
> 
>  Documentation/staging/remoteproc.rst | 483 +++++++++++++++++++++++++++
>  1 file changed, 483 insertions(+)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index 348ee7e508ac..1c15f4d1b9eb 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -29,6 +29,68 @@ remoteproc will add those devices. This makes it possible to reuse the
>  existing virtio drivers with remote processor backends at a minimal development
>  cost.
>  
> +The primary purpose of the remoteproc framework is to download firmware
> +for remote processors and manage their lifecycle. The framework consists
> +of several key components:
> +
> +- **Character Driver**: Provides userspace access to control the remote
> +  processor.
> +- **ELF Utility**: Offers functions for handling ELF files and managing
> +  resources requested by the remote processor.
> +- **Remoteproc Core**: Manages firmware downloads and recovery actions
> +  in case of a remote processor crash.
> +- **Coredump**: Provides facilities for coredumping and tracing from
> +  the remote processor in the event of a crash.
> +- **Userspace Interaction**: Uses sysfs and debugfs to manage the
> +  lifecycle and status of the remote processor.
> +- **Virtio Support**: Facilitates interaction with the virtio and
> +  rpmsg bus.
> +
> +Remoteproc framework Responsibilities
> +=====================================
> +
> +The framework begins by gathering information about the firmware file
> +to be downloaded through the request_firmware function. It supports
> +the ELF format and parses the firmware image to identify the physical
> +addresses that need to be populated from the corresponding ELF sections.
> +The framework also requires knowledge of the logical or I/O-mapped
> +addresses in the application processor. Once this information is

"The framework also requires knowledge of the logical or I/O-mapped addresses in
the application processor". What is that about?

> +obtained from the driver, the framework transfers the data to the
> +specified addresses and starts the remote, along with

"remote" what?

> +any devices physically or logically connected to it.

I have never seen this happening.

> +
> +Dependent devices, referred to as `subdevices` within the framework,
> +are also managed post-registration by their respective drivers.
> +Subdevices can register themselves using `rproc_(add/remove)_subdev`.
> +Non-remoteproc drivers can use subdevices as a way to logically connect
> +to remote and get lifecycle notifications of the remote.
> +
> +The framework oversees the lifecycle of the remote and
> +provides the `rproc_report_crash` function, which the driver invokes
> +upon receiving a crash notification from the remote. The
> +notification method can differ based on the design of the remote
> +processor and its communication with the application processor. For
> +instance, if the remote is a DSP equipped with a watchdog,
> +unresponsive behavior triggers the watchdog, generating an interrupt
> +that routes to the application processor, allowing it to call
> +`rproc_report_crash` in the driver's interrupt context.
> +
> +During crash handling, the framework performs the following actions:
> +
> +a. Sends a request to stop the remote and any connected or
> +   dependent subdevices.
> +b. Generates a coredump, dumping all `resources` requested by the
> +   remote alongside relevant debugging information. Resources are
> +   explained below.
> +c. Reloads the firmware and restarts the remote.
> +
> +If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach and
> +attach callbacks of the driver are invoked without reloading the
> +firmware. This is useful when the remote requires no
> +assistance for recovery, or when the application processor can restart
> +independently. After recovery, the application processor can reattach
> +to the remote.
> +

The above provides a description of some of the things the remoteproc subsystem
does and as such, I would call it "overview" rather than responsabilities.

>  User API
>  ========
>  
> @@ -107,6 +169,239 @@ Typical usage
>  API for implementors
>  ====================
>  
> +It describes the API that can be used by remote processor Drivers
> +that want to use the remote processor Driver Core Framework. This
> +framework provides all interfacing towards user space so that the
> +same code does not have to be reproduced each time. This also means
> +that a remote processor driver then only needs to provide the different
> +routines(operations) that control the remote processor.
> +
> +Each remote processor driver that wants to use the remote processor Driver Core
> +must #include <linux/remoteproc.h> (you would have to do this anyway when
> +writing a rproc device driver). This include file contains following
> +register routine::
> +

The above is very basic information about subsystems in general - please remove.

> +	int devm_rproc_add(struct device *dev, struct rproc *rproc)
> +
> +The devm_rproc_add routine registers a remote processor device.
> +The parameter of this routine is a pointer to a rproc device structure.
> +This routine returns zero on success and a negative errno code for failure.

Look at what is documented for other API functions and do the same here.  

> +
> +The rproc device structure looks like this::
> +
> +  struct rproc {
> +	struct list_head node;
> +	struct iommu_domain *domain;
> +	const char *name;
> +	const char *firmware;
> +	void *priv;
> +	struct rproc_ops *ops;
> +	struct device dev;
> +	atomic_t power;
> +	unsigned int state;
> +	enum rproc_dump_mechanism dump_conf;
> +	struct mutex lock;
> +	struct dentry *dbg_dir;
> +	struct list_head traces;
> +	int num_traces;
> +	struct list_head carveouts;
> +	struct list_head mappings;
> +	u64 bootaddr;
> +	struct list_head rvdevs;
> +	struct list_head subdevs;
> +	struct idr notifyids;
> +	int index;
> +	struct work_struct crash_handler;
> +	unsigned int crash_cnt;
> +	bool recovery_disabled;
> +	int max_notifyid;
> +	struct resource_table *table_ptr;
> +	struct resource_table *clean_table;
> +	struct resource_table *cached_table;
> +	size_t table_sz;
> +	bool has_iommu;
> +	bool auto_boot;
> +	bool sysfs_read_only;
> +	struct list_head dump_segments;
> +	int nb_vdev;
> +	u8 elf_class;
> +	u16 elf_machine;
> +	struct cdev cdev;
> +	bool cdev_put_on_release;
> +	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
> +  };

All that is already part of remoteproc.h and doesn't need to be duplicated here
- please remove.

> +
> +It contains following fields:
> +
> +* node: list node of this rproc object
> +* domain: iommu domain
> +* name: human readable name of the rproc
> +* firmware: name of firmware file to be loaded
> +* priv: private data which belongs to the platform-specific rproc module
> +* ops: platform-specific start/stop rproc handlers
> +* dev: virtual device for refcounting and common remoteproc behavior
> +* power: refcount of users who need this rproc powered up
> +* state: state of the device
> +* dump_conf: Currently selected coredump configuration
> +* lock: lock which protects concurrent manipulations of the rproc
> +* dbg_dir: debugfs directory of this rproc device
> +* traces: list of trace buffers
> +* num_traces: number of trace buffers
> +* carveouts: list of physically contiguous memory allocations
> +* mappings: list of iommu mappings we initiated, needed on shutdown
> +* bootaddr: address of first instruction to boot rproc with (optional)
> +* rvdevs: list of remote virtio devices
> +* subdevs: list of subdevices, to following the running state
> +* notifyids: idr for dynamically assigning rproc-wide unique notify ids
> +* index: index of this rproc device
> +* crash_handler: workqueue for handling a crash
> +* crash_cnt: crash counter
> +* recovery_disabled: flag that state if recovery was disabled
> +* max_notifyid: largest allocated notify id.
> +* table_ptr: pointer to the resource table in effect
> +* clean_table: copy of the resource table without modifications.  Used
> +*      	 when a remote processor is attached or detached from the core
> +* cached_table: copy of the resource table
> +* table_sz: size of @cached_table
> +* has_iommu: flag to indicate if remote processor is behind an MMU
> +* auto_boot: flag to indicate if remote processor should be auto-started
> +* sysfs_read_only: flag to make remoteproc sysfs files read only
> +* dump_segments: list of segments in the firmware
> +* nb_vdev: number of vdev currently handled by rproc
> +* elf_class: firmware ELF class
> +* elf_machine: firmware ELF machine
> +* cdev: character device of the rproc
> +* cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> +* features: indicate remoteproc features
> +

Remove

> +The list of rproc operations is defined as::
> +
> +  struct rproc_ops {
> +	int (*prepare)(struct rproc *rproc);
> +	int (*unprepare)(struct rproc *rproc);
> +	int (*start)(struct rproc *rproc);
> +	int (*stop)(struct rproc *rproc);
> +	int (*attach)(struct rproc *rproc);
> +	int (*detach)(struct rproc *rproc);
> +	void (*kick)(struct rproc *rproc, int vqid);
> +	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
> +	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
> +			  int offset, int avail);
> +	struct resource_table *(*find_loaded_rsc_table)(
> +				struct rproc *rproc, const struct firmware *fw);
> +	struct resource_table *(*get_loaded_rsc_table)(
> +				struct rproc *rproc, size_t *size);
> +	int (*load)(struct rproc *rproc, const struct firmware *fw);
> +	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> +	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	unsigned long (*panic)(struct rproc *rproc);
> +	void (*coredump)(struct rproc *rproc);
> +  };
> +

If you really want to document all the callbacks, it should be done in the
"Implementation callbacks" section following the style that is already in place.

> +Most of the operations are optional. Currently in the implementation
> +there are no mandatory operations, however from the practical standpoint
> +minimum ops are:
> +
> +* start: this is a pointer to the routine that starts the remote processor
> +  device.
> +  The routine needs a pointer to the remote processor device structure as a
> +  parameter. It returns zero on success or a negative errno code for failure.
> +
> +* stop: with this routine the remote processor device is being stopped.
> +
> +  The routine needs a pointer to the remote processor device structure as a
> +  parameter. It returns zero on success or a negative errno code for failure.
> +
> +* da_to_va: this is the routine that needs to translate device address to
> +  application processor virtual address that it can copy code to.
> +
> +  The routine needs a pointer to the remote processor device structure as a
> +  parameter. It returns zero on success or a negative errno code for failure.
> +
> +  The routine provides the device address it finds in the ELF firmware and asks
> +  the driver to convert that to virtual address.
> +
> +All other callbacks are optional in case of ELF provided firmware.
> +
> +* load: this is to load the firmware on to the remote device.
> +
> +  The routine needs firmware file that it needs to load on to the remote processor.
> +  If the driver overrides this callback then default ELF loader will not get used.
> +  Otherwise default framework provided loader gets used.
> +
> +  load = rproc_elf_load_segments;
> +  parse_fw = rproc_elf_load_rsc_table;
> +  find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> +  sanity_check = rproc_elf_sanity_check;
> +  get_boot_addr = rproc_elf_get_boot_addr;
> +
> +* parse_fw: this routing parses the provided firmware. In case of ELF format,
> +  framework provided rproc_elf_load_rsc_table function can be used.
> +
> +* sanity_check: Check the format of the firmware.
> +
> +* coredump: If the driver prefers to manage coredumps independently, it can
> +  implement its own coredump handling. However, the framework offers a default
> +  implementation for the ELF format by assigning this callback to
> +  rproc_coredump, unless the driver has overridden it.
> +
> +* get_boot_addr: In case the bootaddr defined in ELF firmware is different, driver
> +  can use this callback to set a different boot address for remote processor to
> +  starts its reset vector from.
> +
> +* find_loaded_rsc_table: this routine gets the loaded resource table from the firmware.
> +
> +  resource table should have a section named (.resource_table) for the framework
> +  to understand and interpret its content. Resource table is a way for remote
> +  processor to ask for resources such as memory for dumping and logging. Look
> +  at core documentation to know how to create the ELF section for the same.
> +
> +* get_loaded_rsc_table: Driver can customize passing the resource table by overriding
> +  this callback. Framework doesn't provide any default implementation for the same.
> +
> +The driver must provide the following information to the core:
> +
> +a. Translate device addresses (physical addresses) found in the ELF
> +   firmware to virtual addresses in Linux using the `da_to_va`
> +   callback. This allows the framework to copy ELF firmware from the
> +   filesystem to the addresses expected by the remote since
> +   the framework cannot directly access those physical addresses.
> +b. Prepare/unprepare the remote prior to firmware loading,
> +   which may involve allocating carveout and reserved memory regions.
> +c. Implement methods for starting and stopping the remote,
> +   whether by setting registers or sending explicit interrupts,
> +   depending on the hardware design.
> +d. Provide attach and detach callbacks to start the remote
> +   without loading the firmware. This is beneficial when the remote
> +   processor is already loaded and running.
> +e. Implement a load callback for firmware loading, typically using
> +   the ELF loader provided by the framework; currently, only ELF
> +   format is supported.
> +f. Invoke the framework's crash handler API upon detecting a remote
> +   crash.
> +
> +Drivers must fill the `rproc_ops` structure and call `rproc_alloc`
> +to register themselves with the framework.
> +
> +.. code-block:: c
> +
> +   struct rproc_ops {
> +       int (*prepare)(struct rproc *rproc);
> +       int (*unprepare)(struct rproc *rproc);
> +       int (*start)(struct rproc *rproc);
> +       int (*stop)(struct rproc *rproc);
> +       int (*attach)(struct rproc *rproc);
> +       int (*detach)(struct rproc *rproc);
> +       void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len,
> +                          bool *is_iomem);
> +       int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
> +       int (*handle_rsc)(struct rproc *rproc, u32 rsc_type,
> +                         void *rsc, int offset, int avail);
> +       int (*load)(struct rproc *rproc, const struct firmware *fw);
> +       //snip
> +   };

This is already added above, why is it repeated here?

> +
>  ::
>  
>    struct rproc *rproc_alloc(struct device *dev, const char *name,
> @@ -190,6 +485,35 @@ platform specific rproc implementation. This should not be called from a
>  non-remoteproc driver. This function can be called from atomic/interrupt
>  context.
>  
> +To add a subdev corresponding driver can call
> +
> +::
> +
> +  void rproc_add_subdev(struct rproc *rproc, struct rproc_subdev *subdev)
> +
> +To remove a subdev, driver can call.
> +
> +::
> +
> +  void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev)
> +

The above doesn't add value to the documentation and users needing to use these
functions will need to look at the code anyway - please remove.

> +To work with ELF coredump below function can be called
> +
> +::
> +
> +  void rproc_coredump_cleanup(struct rproc *rproc)
> +  void rproc_coredump(struct rproc *rproc)
> +  void rproc_coredump_using_sections(struct rproc *rproc)
> +  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
> +  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> +                                        dma_addr_t da, size_t size,
> +                                        void (*dumpfn)(struct rproc *rproc,
> +                                        struct rproc_dump_segment *segment,
> +                                        void *dest, size_t offset,
> +                                        size_t size))
> +
> +Remember that coredump functions provided by the framework only works with ELF format.
> +

Remove

>  Implementation callbacks
>  ========================
>  
> @@ -228,6 +552,123 @@ the exact virtqueue index to look in is optional: it is easy (and not
>  too expensive) to go through the existing virtqueues and look for new buffers
>  in the used rings.
>  
> +Userspace control methods
> +==========================
> +
> +At times, userspace may need to check the state of the remote processor to
> +prevent other processes from using it. For instance, if the remote processor
> +is a DSP used for playback, there may be situations where the DSP is
> +undergoing recovery and cannot be used. In such cases, attempts to access the
> +DSP for playback should be blocked. The rproc framework provides sysfs APIs
> +to inform userspace of the processor's current status which should be utilised
> +to achieve the same.
> +

Remove

> +Additionally, there are scenarios where userspace applications need to explicitly
> +control the rproc. In these cases, rproc also offers the file descriptors.
> +
> +Below set of commands can be used to start and stop the rproc
> +where 'X' refers to instance of associated remoteproc. There can be systems
> +where there are more than one rprocs such as multiple DSP's
> +connected to application processors running Linux.
> +
> +.. code-block:: c
> +
> +   echo start > /sys/class/remoteproc/remoteprocX/state
> +   echo stop > /sys/class/remoteproc/remoteprocX/state
> +
> +To know the state of rproc:
> +
> +.. code-block:: c
> +
> +   cat /sys/class/remoteproc/remoteprocX/state
> +
> +
> +To dynamically replace firmware, execute the following commands:
> +
> +.. code-block:: c
> +
> +   echo stop > /sys/class/remoteproc/remoteprocX/state
> +   echo -n <firmware_name> >
> +   /sys/class/remoteproc/remoteprocX/firmware
> +   echo start > /sys/class/remoteproc/remoteprocX/state
> +
> +To simulate a remote crash, execute:
> +
> +.. code-block:: c
> +
> +   echo 1 > /sys/kernel/debug/remoteproc/remoteprocX/crash
> +
> +To get the trace logs, execute
> +
> +.. code-block:: c
> +
> +   cat /sys/kernel/debug/remoteproc/remoteprocX/crashX
> +
> +where X will be 0 or 1 if there are 2 resources. Also, this
> +file will only exist if resources are defined in ELF firmware
> +file.
> +
> +The coredump feature can be disabled with the following command:
> +
> +.. code-block:: c
> +
> +   echo disabled > /sys/kernel/debug/remoteproc/remoteprocX/coredump
> +
> +Userspace can also control start/stop of rproc by using a

s/rproc/remote processor

> +remoteproc Character Device, it can open the open a file descriptor

s/Character Device/character device

> +and write `start` to initiate it, and `stop` to terminate it.
> +Below set of api's can be used to start and stop the rproc
> +where 'X' refers to instance of associated remoteproc. There can be systems
> +where there are more than one rprocs such as multiple DSP's
> +connected to application processors running Linux.

Duplication from above - remove.

> +
> +.. code-block:: c
> +
> +   echo start > /sys/class/remoteproc/remoteprocX/state
> +   echo stop > /sys/class/remoteproc/remoteprocX/state
> +
> +To know the state of rproc:
> +
> +.. code-block:: c
> +
> +   cat /sys/class/remoteproc/remoteprocX/state
> +

Remove

> +
> +To dynamically replace firmware, execute the following commands:
> +
> +.. code-block:: c
> +
> +   echo stop > /sys/class/remoteproc/remoteprocX/state
> +   echo -n <firmware_name> >
> +   /sys/class/remoteproc/remoteprocX/firmware
> +   echo start > /sys/class/remoteproc/remoteprocX/state
> +
> +To simulate a remote crash, execute:
> +
> +.. code-block:: c
> +
> +   echo 1 > /sys/kernel/debug/remoteproc/remoteprocX/crash
> +
> +To get the trace logs, execute
> +
> +.. code-block:: c
> +
> +   cat /sys/kernel/debug/remoteproc/remoteprocX/crashX
> +
> +where X will be 0 or 1 if there are 2 resources. Also, this
> +file will only exist if resources are defined in ELF firmware
> +file.
> +
> +The coredump feature can be disabled with the following command:
> +
> +.. code-block:: c
> +
> +   echo disabled > /sys/kernel/debug/remoteproc/remoteprocX/coredump
> +
> +Userspace can also control start/stop of rproc by using a
> +remoteproc Character Device, it can open the open a file descriptor
> +and write `start` to initiate it, and `stop` to terminate it.

Duplication from above - remove.

> +
>  Binary Firmware Structure
>  =========================
>  
> @@ -340,6 +781,48 @@ We also expect that platform-specific resource entries will show up
>  at some point. When that happens, we could easily add a new RSC_PLATFORM
>  type, and hand those resources to the platform-specific rproc driver to handle.
>  
> +if the remote requests both `RSC_TRACE` and `RSC_CARVEOUT` for memory
> +allocation, the ELF firmware can be structured as follows:
> +
> +.. code-block:: c
> +
> +   #define MAX_SHARED_RESOURCE 2
> +   #define LOG_BUF_SIZE 1000
> +   #define CARVEOUT_DUMP_PA 0x12345678
> +   #define CARVEOUT_DUMP_SIZE 2000
> +
> +   struct shared_resource_table {
> +       u32 ver;
> +       u32 num;
> +       u32 reserved[2];
> +       u32 offset[MAX_SHARED_RESOURCE];
> +       struct fw_rsc_trace log_trace;
> +       struct fw_rsc_carveout dump_carveout;
> +   };
> +
> +   volatile struct shared_resource_table table = {
> +       .ver = 1,
> +       .num = 2,
> +       .reserved = {0, 0},
> +       .offset = {
> +           offsetof(struct resource_table, log_trace),
> +           offsetof(struct resource_table, dump_carveout),
> +       },
> +       .log_trace = {
> +           RSC_TRACE,
> +           (u32)log_buf, LOG_BUF_SIZE, 0, "log_trace",
> +       },
> +       .dump_carveout = {
> +           RSC_CARVEOUT,
> +           (u32)FW_RSC_ADDR_ANY, CARVEOUT_PA, 0, "carveout_dump",
> +       },
> +   };
> +
> +The framework creates a sysfs file when it encounters the `RSC_TRACE`
> +type to expose log information to userspace. Other resource types are
> +handled accordingly. In the example above, `CARVEOUT_DUMP_SIZE` bytes
> +of DMA memory will be allocated starting from `CARVEOUT_DUMP_PA`.
> +

Remove

>  Virtio and remoteproc
>  =====================
>  

Before spinning off another revision I encourage you to spend time looking at
existing documentation.  Reading various mailing lists with a special
focus on how people split their patches based on topics would also be
beneficial.

Lastly, typing my email address correctly would be highly appreciated.

Thanks,
Mathieu

> -- 
> 2.39.3 (Apple Git-146)
> 
> 
