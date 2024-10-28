Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706A18E34D;
	Mon, 28 Oct 2024 03:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087441; cv=none; b=OeaJIfYSjZN22ccTK24cAKx60Um3UG481phhc/NtzdIlh7ci3/HEI0FMDTrdoMNiRYrWx0dOClT+mVVrLeGIVz8SkTOpom3wacKJvo7oEIVJIGZumCwjOaH3SZBK36S2zALvC/m4q2sTzY1WO76wrdjqUUfe1KrF28PVCi1/NiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087441; c=relaxed/simple;
	bh=XJkq5TaJeUl/Z1usdrYPxI317H4YZvx4Ify2uy3XAhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luAmOjK+SkJK+s38KBvftOROjD0IUfupxqwUANzKQit85kUaNFJSuwxHbFRVfSnN8ohtRF96h6jM+Ad1HckV98bbIc4hQ35nSMuLIRzRwiVHqBHKRJevHKimv/yfyCaI+Txe7yoT5FWAgG8079OZzWJcWo0M4pcZFiORpn8nWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIyJC6Ih; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIyJC6Ih"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso2636386a12.0;
        Sun, 27 Oct 2024 20:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087438; x=1730692238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDz5Wn2zOpQMKbGl8TBVx7XbmXnH5uPH4A79K/giBFY=;
        b=RIyJC6IhnRTTNWyox0+eccGySqgCzlRYl06af/ULkBolgWyWoALG9T7ESOlrlzW3er
         T1Jf+ZLC71afUygrVlmSix5tjxhNPE7nN07XiJ4tsRBIOllrYVl/aRyRepba+mDMhwME
         8VTZ5GOZFZGLgOnKTmRmF7KMVkUF9g8XW0jz+eSwVEPrzQBA2SJdY/pGqEvwFBLnjR1q
         5t4IuFnUHiX/NZEUBmsj2S+YPggURPZQPiExySPtWdkF0QH7MLiszFC8oiiG27gS9lIX
         XH4KfBbf4vTrBBMrBfTowscLZjNc2lE1E0OtltgfmOBpzDhP8eKLm7lOGPK29pellyOM
         1PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087438; x=1730692238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDz5Wn2zOpQMKbGl8TBVx7XbmXnH5uPH4A79K/giBFY=;
        b=OUhIZQCROyIjHD04RsDqx0Qg77AdlzpP8URubyOCaEaD2Jxe4jAuh93eUF3GGbatXi
         Bk7at1Z6z3SSOcT/qiNNHKlSI5MoaXeLC1nIcF3q0cihG4udmKqBHTi/FVIhnZ+8kfTS
         fC/yroiO8i/9Mhk7aZ3+/n9A4iJQ1q8SAMK/JcoDbJmdUmL1JqHcBJmNjcwYpBH8Ckyy
         YOwVq1/d0w3EXC8yxHxpEoazei+CpLfcetijT9Z/VyXjtk568PVf1cT3DyF7eVLoJO5y
         0DTPPd/3sHbWIdwoo/+FKpsSNmuZseDX0qYxAWtNFR27kyt0fQ2hlQO0B3EVWWNJNLmw
         OL1A==
X-Forwarded-Encrypted: i=1; AJvYcCUjMMpSPa92+qf0VcV7GjdtRWAKWFwY68humpYF8yMNKBvJEFxJzog8BdVnIYDGj3irOXoSBuXmLRPwx9CL0+bbpg==@vger.kernel.org, AJvYcCXUIEaYD+pYoBNUh2z+ecgtAwVihIognCFW5EPhIwhZzSYmQKPUxK6+xajkPE2hRTnS+91eaLCheUcKzXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dVH39tECD1m4gauyVAMXD7H+E/OOpfzZusdiKK9MnWcvLKRz
	oTT7JHWnFZ5DBqzD2zrZ2gmZ2PpP6fAGIZx+5y914cyawlNDTdlL
X-Google-Smtp-Source: AGHT+IGJuCbl+H0J4p0AFC8fLl64GwcQQpm7VYoLRCtbbASvvz6XweA3qxB5RXrlEXjOB9cxzY8wdg==
X-Received: by 2002:a05:6a21:168e:b0:1d8:ae07:bf8 with SMTP id adf61e73a8af0-1d9a84b8d11mr8473186637.31.1730087437477;
        Sun, 27 Oct 2024 20:50:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e97asm41801665ad.195.2024.10.27.20.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6767049E58E2; Mon, 28 Oct 2024 10:50:31 +0700 (WIB)
Date: Mon, 28 Oct 2024 10:50:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: anish kumar <yesanishhere@gmail.com>, andersson@kernel.org,
	mathieu.poirier@linaro.orgi, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V5] remoteproc: Documentation: update with details
Message-ID: <Zx8KBkBPX5qJYWWg@archie.me>
References: <20241026212259.31950-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iP+H4GMYQ8a8jVrB"
Content-Disposition: inline
In-Reply-To: <20241026212259.31950-1-yesanishhere@gmail.com>


--iP+H4GMYQ8a8jVrB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2024 at 02:22:59PM -0700, anish kumar wrote:
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
> +* cdev_put_on_release: flag to indicate if remoteproc should be shutdown=
 on @char_dev release
> +* features: indicate remoteproc features

clean_table list item, has two separated bullets instead of being spanned
across two lines, so I fix its formatting:

---- >8 ----
diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/r=
emoteproc.rst
index 1c15f4d1b9eb43..b456f94a1d73f1 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -260,7 +260,7 @@ It contains following fields:
 * max_notifyid: largest allocated notify id.
 * table_ptr: pointer to the resource table in effect
 * clean_table: copy of the resource table without modifications.  Used
-*      	 when a remote processor is attached or detached from the core
+  when a remote processor is attached or detached from the core
 * cached_table: copy of the resource table
 * table_sz: size of @cached_table
 * has_iommu: flag to indicate if remote processor is behind an MMU

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
> +	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_io=
mem);
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
> <snipped>...
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
> =20
>    struct rproc *rproc_alloc(struct device *dev, const char *name,
> @@ -190,6 +485,35 @@ platform specific rproc implementation. This should =
not be called from a
>  non-remoteproc driver. This function can be called from atomic/interrupt
>  context.
> =20
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
> +  void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *sub=
dev)
> +
> +To work with ELF coredump below function can be called
> +
> +::
> +
> +  void rproc_coredump_cleanup(struct rproc *rproc)
> +  void rproc_coredump(struct rproc *rproc)
> +  void rproc_coredump_using_sections(struct rproc *rproc)
> +  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, siz=
e_t size)
> +  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> +                                        dma_addr_t da, size_t size,
> +                                        void (*dumpfn)(struct rproc *rpr=
oc,
> +                                        struct rproc_dump_segment *segme=
nt,
> +                                        void *dest, size_t offset,
> +                                        size_t size))
> +

For consistency, all other C snippets should be syntax-highlighted as such
by ``code-block:: c`` directive.

> +Below set of commands can be used to start and stop the rproc
> +where 'X' refers to instance of associated remoteproc. There can be syst=
ems
> +where there are more than one rprocs such as multiple DSP's
> +connected to application processors running Linux.
> +
> +.. code-block:: c
> +
> +   echo start > /sys/class/remoteproc/remoteprocX/state
> +   echo stop > /sys/class/remoteproc/remoteprocX/state

Shouldn't this and following shell snippets use bash syntax highlighting
(``code-block:: bash``) or simply double colon (``::``) instead?

> +
> +To know the state of rproc:
"To retrieve ..."
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
> +Below set of api's can be used to start and stop the rproc
> +where 'X' refers to instance of associated remoteproc. There can be syst=
ems
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

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--iP+H4GMYQ8a8jVrB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZx8KAQAKCRD2uYlJVVFO
owe+AP9JpaT4JtqabOBVLmu3FqpNiBW81HKM7wSE1rHyUupDSwEAh7rD2/ulV5pb
DiDnxPyrfxu1yc9hrIEjvfJAAk2HsQA=
=4S+W
-----END PGP SIGNATURE-----

--iP+H4GMYQ8a8jVrB--
