Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1481CF2A4;
	Tue,  5 Nov 2024 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796304; cv=none; b=FrjMcvmTmexD1NBO4pBGOFCF3HtBMC03GN7oO0pm7cXL5CopKO3Z/sq6Rcs7NZ7PwRqraG41QwEIFGO1L5wX0ObhA3dTruEYyggq9Rt4oHBDZNCfirBCtYZVlqQEzQVrTq0Zm8OFw2fVAyAPYlHueWnt14wuMhZiy2adFzdaeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796304; c=relaxed/simple;
	bh=uIEX38rD2Dp2YvPb0CWzt+22v3w/29yIv4Bs9GcaGiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eD3DPR860aWryqy4Cl7qRqy4hkym4U3UgyJYaCfju4DApjth5GIzXpiwX/vC6SATHxODxAJ0CFLhvGuzTGPv835m6V9vk3YA+hY0vEepUpol3H0xSs9ehTci26sQMOw2p/G6fTjWmu8WTCUo+5QB0hZJRqiNvfU0vPWlT96gHVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=p2KNYWfH; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="p2KNYWfH"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A55XTrU013201;
	Tue, 5 Nov 2024 09:44:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VyV8n9ujU6lQeDeVC/02AbQjrLqYsRcILg2FHiUobMk=; b=p2KNYWfH7REi8WgU
	sEpwKdkfmMm3S59/aYOghK/fgioTZH58xEyrIhdyfZZ9Hai3hwUpF0+4c0IxUGet
	HtIzGs3jJE76uYaO0OdAybhSZ6MnDrKHoV/ICNRmJNp19UzjNKx0Cxta6ya2dNkg
	VOrma/Zzh+gdreQL/+MTfXo9biuzOX7WLjWhXyYDsQoaXN2XU3co+K6v1d7kLWTM
	ZxYiTaXojo6Ma+Uk4tWzTWEjIcX4AUpHyFRdwvxWzeMqhBZYjAK8ZJTW2hQRsE8h
	pZozmMUSUKUcSDfS1Cnh3Yr6+QQR2H+xZ7PL/867BFGYjQKoFRqXV0rtuR0vG4+0
	O7V/lA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nywn8hsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 09:44:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 612A54004B;
	Tue,  5 Nov 2024 09:43:49 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92754255290;
	Tue,  5 Nov 2024 09:43:12 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 09:43:12 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 09:43:11 +0100
Message-ID: <bfb6c0e3-d550-4bcb-a22e-e2bcab8b908a@foss.st.com>
Date: Tue, 5 Nov 2024 09:43:11 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5] remoteproc: Documentation: update with details
To: anish kumar <yesanishhere@gmail.com>, <andersson@kernel.org>,
        <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-doc@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20241026212259.31950-1-yesanishhere@gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20241026212259.31950-1-yesanishhere@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hello Anish,

On 10/26/24 23:22, anish kumar wrote:
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

Seems that there is a duplication with Character Driver.
What about merging both and creating a separate bullet for the debug interface?

- **Userspace Interaction**: Uses sysfs and/or the character driver to  manage
the lifecycle and status of the remote processor.
- **Debug Interface**: Uses debugfs for trace, coredump, and information
  on associated resources (resource table, carveout memories, etc.).

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

By default it supports the ELF format, but the rproc_ops struct allows drivers
to support some other formats.

> +The framework also requires knowledge of the logical or I/O-mapped
> +addresses in the application processor. Once this information is
> +obtained from the driver, the framework transfers the data to the

I suppose here that data is the firmware image, right?
what about "The framework loads the firmware image in the remote procesor
memories ans starts..."?

> +specified addresses and starts the remote, along with
> +any devices physically or logically connected to it.


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
we could mention that the recovery mechanism can be blocked using the
'recovery_disabled' rproc field.

> +
> +If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach and
> +attach callbacks of the driver are invoked without reloading the
> +firmware. This is useful when the remote requires no
> +assistance for recovery, or when the application processor can restart
> +independently. After recovery, the application processor can reattach
> +to the remote.
> +
>  User API
>  ========
>  
> @@ -107,6 +169,239 @@ Typical usage
>  API for implementors
>  ====================
>  
> +It describes the API that can be used by remote processor Drivers

s/Drivers/drivers/

> +that want to use the remote processor Driver Core Framework. This

Is there any reason to have uppercase in "Driver Core Framework"?

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
> +	int devm_rproc_add(struct device *dev, struct rproc *rproc)
> +
> +The devm_rproc_add routine registers a remote processor device.
> +The parameter of this routine is a pointer to a rproc device structure.
> +This routine returns zero on success and a negative errno code for failure.
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

Only the command to select the firmware image to load seems important
above, I would reorder the descriptions.

+By default the firmware image file should be stored in /lib/firmware.
+To select the firmware image to load:
+
+.. code-block:: c
+
+   echo -n <firmware_name> > /sys/class/remoteproc/remoteprocX/firmware
+
+To control the remote processor:
+
+.. code-block:: c
+
+   echo start > /sys/class/remoteproc/remoteprocX/state
+   echo stop > /sys/class/remoteproc/remoteprocX/state
+
+To know the state of the remote processor:
+
+.. code-block:: c
+
+   cat /sys/class/remoteproc/remoteprocX/state
+

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

The descriptions above concern debugfs, not sysfs, and should be part of a
separate chapter.

Regards,
Arnaud

> +Userspace can also control start/stop of rproc by using a
> +remoteproc Character Device, it can open the open a file descriptor
> +and write `start` to initiate it, and `stop` to terminate it.
> +Below set of api's can be used to start and stop the rproc
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
> +remoteproc Character Device, it can open the open a file descriptor
> +and write `start` to initiate it, and `stop` to terminate it.
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
>  Virtio and remoteproc
>  =====================
>  
