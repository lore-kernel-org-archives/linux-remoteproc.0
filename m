Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E971E50B;
	Thu, 17 Oct 2024 01:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729127504; cv=none; b=Nd60zaaIlqmrLrxj8v602LIq6WLctzUsyePHy1bBxUunDxXbSJc6yLkl0z0AS+nfN152U9J8NZbfgmS1qMMZC94XEnrjJTYsJwmPyAVwTCtGsv1VOYeiAYoJSJF/yyVGx+liP6aZAveQudkE7xto07jfi0jw76OcmtxqmdXaMgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729127504; c=relaxed/simple;
	bh=wd5rz2iT5W3LL7Jy4599w3wbM7JV+QbqDSE6XFVwOdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RKVrcvhUsqL9sKYd6sbi+41eV9WQyOIycMl1H8VdqfGhEgIFDZ57Vr5j6AMOt+zb+lEF5GYluReUi2PGSWdZxyENgUZVGNEr83ZPCxVxLJvScRNs9GVEbgCwY5DKMKlLL2d5Mt095Hj1xGMam/eUaBvnorg20JhA1utuWEHxHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kM+xKhne; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kM+xKhne"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e5fb8a4e53so179048b6e.1;
        Wed, 16 Oct 2024 18:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729127500; x=1729732300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbKB22yAXJSBZu5ajnaRsDkk6+3L+1OMs+dtUhWyay8=;
        b=kM+xKhneERIZPcSaUvO6+NdYWrbl1HBvbNyf0SRs3y6ZTuNTRM7u0w4tPopNjTCuuO
         nNLjp/Nwn+rXS0fKW+UkAHQ13YCHMdU9RMt436pHwfwOCN1u1RxiJAuG+Im9wwDIAQXQ
         fbyOYeA7jPiIz9FtzFw+iKBEsSoR2iIzDYZpEdeXOTC9kGHUe8FAZk+2Ln34u6RkJ0vT
         4C8hjUGLpsTRK1MxXv0gC7imqYxsfRLfJvT69Fhj0S2lRpcJlGON78R0aKGlm3pIki12
         UT0x21qxQyj/M9lbP8JEZgLH9fRsLqK4JsLoI2DWdxdZbFBifW0JVoFLNGnKQ6Rsh/t/
         sTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729127500; x=1729732300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbKB22yAXJSBZu5ajnaRsDkk6+3L+1OMs+dtUhWyay8=;
        b=fhHTu1trRVUpW9A6OW6vWuz8Zgxqw7Tj0NmCOeN5/9/tVXv4GaD7SiQWRdgPMocLPW
         uh0SNaYRn5DjQ5ej9UqQXszaQtB7Nktvo74I9/9bxdzJSo6fo4YjON1v20SVXzuHBSQh
         qCjSQMCdqtMN7uteNrRuJYK8xcqHxmf9ln7r/zPjP5xn3gmPVErdfekGDDUcZ0HolYVv
         eohDzDY/c8oRSxSpMiFXjWaMLtrlC4hiNPW9Iq4nI+2GRFDDYYmZHDlXoZPNqfv/EVPJ
         nagsI5YoeNDazr6HfrtpKVnAiHbzrKmJdxjYHjGomZ3alWM7ULKrxjU34UAfUZfo/3ZH
         N3XA==
X-Forwarded-Encrypted: i=1; AJvYcCUY9w3Hg0lhlAc/IE0dSn3/3liAF4gpP3L3fym5y6QJYO9+H/iRn+cEhjOc06DbXRTeiXHmebqtsNU/OFOgxZ+rQA==@vger.kernel.org, AJvYcCW3Pfj6CHcXHUnviIz+AVaIQkZLKv6sw74BUaEaBTNuHQqiceC+VugS09i6OovgbGs8w//jHJj5mY56kzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEMttXQ78/MhyvqkiCSzhlRY0BHjikF/pdaA6Nc7n5vatZncpH
	m58ohA/6y2t+8zAfB1u4gT/FNGg39u6LPfcidWbIRYePiP2Rsq53
X-Google-Smtp-Source: AGHT+IGRhw4ZbgMdgSWQqlfC0vXKROBt5B0wtA0/32M3ZnKnkCx3xagaht/xi+Q1uX2cca321kGJ3w==
X-Received: by 2002:a05:6808:3194:b0:3e0:7441:e487 with SMTP id 5614622812f47-3e5c911995fmr16971240b6e.37.1729127500124;
        Wed, 16 Oct 2024 18:11:40 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:a3:66ab:6280:378c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e5f353e8dasm717822b6e.54.2024.10.16.18.11.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Oct 2024 18:11:38 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.orgi,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH v2 2/2] remoteproc: Documentation: add documentation
Date: Wed, 16 Oct 2024 18:11:24 -0700
Message-Id: <20241017011124.69257-2-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241017011124.69257-1-yesanishhere@gmail.com>
References: <20241017011124.69257-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Add documentation for remoteproc core
2. Add userspace api documentation.
3. Add kernel driver api documentation.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/

 Documentation/remoteproc/core.rst             | 252 ++++++++++++++++++
 Documentation/remoteproc/index.rst            |  27 ++
 Documentation/remoteproc/rproc-api.rst        |  75 ++++++
 Documentation/remoteproc/rproc-kernel-api.rst | 239 +++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 594 insertions(+)
 create mode 100644 Documentation/remoteproc/core.rst
 create mode 100644 Documentation/remoteproc/index.rst
 create mode 100644 Documentation/remoteproc/rproc-api.rst
 create mode 100644 Documentation/remoteproc/rproc-kernel-api.rst

diff --git a/Documentation/remoteproc/core.rst b/Documentation/remoteproc/core.rst
new file mode 100644
index 000000000000..a59c2c5bc8e6
--- /dev/null
+++ b/Documentation/remoteproc/core.rst
@@ -0,0 +1,252 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================================
+General description of the remoteproc subsystem
+===============================================
+
+Authors:
+	- anish kumar <yesanishhere@gmail.com>
+
+.. Contents:
+
+   1.  Introduction
+   2.  Remoteproc framework responsibilities
+   3.  Remoteproc driver responsibilities
+   4.  Virtio and rpmsg
+
+1. Introduction
+======================
+
+Modern System on Chips (SoCs) typically integrate heterogeneous remote
+processor devices in asymmetric multiprocessing (AMP) configurations.
+These processors may run different operating systems, such as Linux and
+various real-time operating systems (RTOS).
+
+For example, the OMAP4 platform features dual Cortex-A9 cores, dual
+Cortex-M3 cores, and a C64x+ DSP. In a standard setup, the Cortex-A9
+cores execute Linux in a symmetric multiprocessing (SMP) configuration,
+while the M3 cores and DSP run independent instances of an RTOS.
+
+The remoteproc framework allows various platforms and architectures to
+manage remote processors, including operations such as powering on,
+loading firmware, and powering off. This framework abstracts hardware
+differences, promoting code reuse and minimizing duplication. It also
+supports rpmsg virtio devices for remote processors that utilize this
+communication method. Consequently, platform-specific remoteproc drivers
+need only implement a few low-level handlers, enabling seamless operation
+of all rpmsg drivers. (For more details about the virtio-based rpmsg
+bus and its drivers, refer to :doc:`Documentation/staging/rpmsg.rst`.)
+
+Additionally, the framework allows for the registration of various
+virtio devices. Firmware can publish the types of virtio devices it
+supports, facilitating their addition to the remoteproc framework. This
+flexibility enables the reuse of existing virtio drivers with remote
+processor backends at minimal development cost.
+
+The primary purpose of the remoteproc framework is to download firmware
+for remote processors and manage their lifecycle. The framework consists
+of several key components:
+
+- **Character Driver**: Provides userspace access to control the remote
+  processor.
+- **ELF Utility**: Offers functions for handling ELF files and managing
+  resources requested by the remote processor.
+- **Remoteproc Core**: Manages firmware downloads and recovery actions
+  in case of a remote processor crash.
+- **Coredump**: Provides facilities for coredumping and tracing from
+  the remote processor in the event of a crash.
+- **Userspace Interaction**: Uses sysfs and debugfs to manage the
+  lifecycle and status of the remote processor.
+- **Virtio Support**: Facilitates interaction with the virtio and
+  rpmsg bus.
+
+From here on, references to "framework" denote the remoteproc
+framework, and "driver" refers to the remoteproc driver that utilizes
+the framework for managing remote processors.
+
+2. Remoteproc framework Responsibilities
+========================================
+
+The framework begins by gathering information about the firmware file
+to be downloaded through the request_firmware function. It supports
+the ELF format and parses the firmware image to identify the physical
+addresses that need to be populated from the corresponding ELF sections.
+The framework also requires knowledge of the logical or I/O-mapped
+addresses in the application processor. Once this information is
+obtained from the driver, the framework transfers the data to the
+specified addresses and starts the remote, along with
+any devices physically or logically connected to it.
+
+Dependent devices, referred to as `subdevices` within the framework,
+are also managed post-registration by their respective drivers.
+Subdevices can register themselves using `rproc_(add/remove)_subdev`.
+Non-remoteproc drivers can use subdevices as a way to logically connect
+to remote and get lifecycle notifications of the remote.
+
+The framework oversees the lifecycle of the remote and
+provides the `rproc_report_crash` function, which the driver invokes
+upon receiving a crash notification from the remote. The
+notification method can differ based on the design of the remote
+processor and its communication with the application processor. For
+instance, if the remote is a DSP equipped with a watchdog,
+unresponsive behavior triggers the watchdog, generating an interrupt
+that routes to the application processor, allowing it to call
+`rproc_report_crash` in the driver's interrupt context.
+
+During crash handling, the framework performs the following actions:
+
+a. Sends a request to stop the remote and any connected or
+   dependent subdevices.
+b. Generates a coredump, dumping all `resources` requested by the
+   remote alongside relevant debugging information. Resources are
+   explained below.
+c. Reloads the firmware and restarts the remote.
+
+If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach and
+attach callbacks of the driver are invoked without reloading the
+firmware. This is useful when the remote requires no
+assistance for recovery, or when the application processor can restart
+independently. After recovery, the application processor can reattach
+to the remote.
+
+The remote can request resources from the framework, which
+allocates a ".resource_table" section. During the ELF parsing phase,
+the framework identifies this section and calls the appropriate
+handler to allocate the requested resources.
+
+Resource management within the framework can accommodate any type of
+`fw_resource_type`.
+
+.. code-block:: c
+
+   enum fw_resource_type {
+       RSC_CARVEOUT      = 0,
+       RSC_DEVMEM        = 1,
+       RSC_TRACE         = 2,
+       RSC_VDEV          = 3,
+       RSC_LAST          = 4,
+       RSC_VENDOR_START  = 128,
+       RSC_VENDOR_END    = 512,
+   };
+
+   struct resource_table {
+       u32 ver;
+       u32 num;
+       u32 reserved[2];
+       u32 offset[];
+   } __packed;
+
+   struct fw_rsc_hdr {
+       u32 type;
+       u8 data[];
+   } __packed;
+
+For example, if the remote requests both `RSC_TRACE` and
+`RSC_CARVEOUT` for memory allocation, the ELF firmware can be structured
+as follows:
+
+.. code-block:: c
+
+   #define MAX_SHARED_RESOURCE 2
+   #define LOG_BUF_SIZE 1000
+   #define CARVEOUT_DUMP_PA 0x12345678
+   #define CARVEOUT_DUMP_SIZE 2000
+
+   struct shared_resource_table {
+       u32 ver;
+       u32 num;
+       u32 reserved[2];
+       u32 offset[MAX_SHARED_RESOURCE];
+       struct fw_rsc_trace log_trace;
+       struct fw_rsc_carveout dump_carveout;
+   };
+
+   volatile struct shared_resource_table table = {
+       .ver = 1,
+       .num = 2,
+       .reserved = {0, 0},
+       .offset = {
+           offsetof(struct resource_table, log_trace),
+           offsetof(struct resource_table, dump_carveout),
+       },
+       .log_trace = {
+           RSC_TRACE,
+           (u32)log_buf, LOG_BUF_SIZE, 0, "log_trace",
+       },
+       .dump_carveout = {
+           RSC_CARVEOUT,
+           (u32)FW_RSC_ADDR_ANY, CARVEOUT_PA, 0, "carveout_dump",
+       },
+   };
+
+The framework creates a sysfs file when it encounters the `RSC_TRACE`
+type to expose log information to userspace. Other resource types are
+handled accordingly. In the example above, `CARVEOUT_DUMP_SIZE` bytes
+of DMA memory will be allocated starting from `CARVEOUT_DUMP_PA`.
+
+
+3. Remoteproc driver responsibilities
+=====================================
+
+The driver must provide the following information to the core:
+
+a. Translate device addresses (physical addresses) found in the ELF
+   firmware to virtual addresses in Linux using the `da_to_va`
+   callback. This allows the framework to copy ELF firmware from the
+   filesystem to the addresses expected by the remote since
+   the framework cannot directly access those physical addresses.
+b. Prepare/unprepare the remote prior to firmware loading,
+   which may involve allocating carveout and reserved memory regions.
+c. Implement methods for starting and stopping the remote,
+   whether by setting registers or sending explicit interrupts,
+   depending on the hardware design.
+d. Provide attach and detach callbacks to start the remote
+   without loading the firmware. This is beneficial when the remote
+   processor is already loaded and running.
+e. Implement a load callback for firmware loading, typically using
+   the ELF loader provided by the framework; currently, only ELF
+   format is supported.
+f. Invoke the framework's crash handler API upon detecting a remote
+   crash.
+
+Drivers must fill the `rproc_ops` structure and call `rproc_alloc`
+to register themselves with the framework.
+
+.. code-block:: c
+
+   struct rproc_ops {
+       int (*prepare)(struct rproc *rproc);
+       int (*unprepare)(struct rproc *rproc);
+       int (*start)(struct rproc *rproc);
+       int (*stop)(struct rproc *rproc);
+       int (*attach)(struct rproc *rproc);
+       int (*detach)(struct rproc *rproc);
+       void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len,
+                          bool *is_iomem);
+       int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
+       int (*handle_rsc)(struct rproc *rproc, u32 rsc_type,
+                         void *rsc, int offset, int avail);
+       int (*load)(struct rproc *rproc, const struct firmware *fw);
+       //snip
+   };
+
+
+4. Virtio and Remoteproc
+========================
+
+The firmware must provide remoteproc with information regarding the
+virtio devices it supports and their configurations: an `RSC_VDEV`
+resource entry should detail the virtio device ID (as defined in
+`virtio_ids.h`), virtio features, virtio config space, vrings
+information, etc.
+
+Upon registration of a new remote, the remoteproc framework
+searches for its resource table and registers the supported virtio
+devices. A firmware may support multiple virtio devices, of various
+types (a single remote can support multiple rpmsg virtio
+devices if required).
+
+Moreover, `RSC_VDEV` resource entries suffice for static allocation
+of virtio devices. Dynamic allocations will also be supported using
+the rpmsg bus, akin to the handling of dynamic allocations for rpmsg
+channels. For more information, refer to `rpmsg.txt`.
diff --git a/Documentation/remoteproc/index.rst b/Documentation/remoteproc/index.rst
new file mode 100644
index 000000000000..631797f49b32
--- /dev/null
+++ b/Documentation/remoteproc/index.rst
@@ -0,0 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================================================
+remoteproc - remote processor subsystem in Linux(TM) kernel
+========================================================================
+
+Authors:
+	- anish kumar  <yesanishhere@gmail.com>
+
+   remote processor subsystem is a way to manage the lifecycle of
+   a subsytem that is external to the Linux. The remoteproc framework
+   allows different platforms/architectures to control (power on,
+   load firmware, power off) those remote processors while abstracting
+   the hardware differences, so the entire driver doesn't need to be
+   duplicated.
+
+.. toctree::
+   :maxdepth: 1
+
+   core
+   rproc-api
+   rproc-kernel-api
+
+Mailing List
+------------
+To post a message, send an email to
+linux-remoteproc@vger.kernel.org
diff --git a/Documentation/remoteproc/rproc-api.rst b/Documentation/remoteproc/rproc-api.rst
new file mode 100644
index 000000000000..548d3658fc1c
--- /dev/null
+++ b/Documentation/remoteproc/rproc-api.rst
@@ -0,0 +1,75 @@
+==================================
+The Linux Remoteproc userspace API
+==================================
+
+Introduction
+============
+
+A Remoteproc (rproc) is a subsystem for managing the lifecycle
+of a processor that is connected to Linux.
+
+At times, userspace may need to check the state of the remote processor to
+prevent other processes from using it. For instance, if the remote processor
+is a DSP used for playback, there may be situations where the DSP is
+undergoing recovery and cannot be used. In such cases, attempts to access the
+DSP for playback should be blocked. The rproc framework provides sysfs APIs
+to inform userspace of the processor's current status which should be utilised
+to achieve the same.
+
+Additionally, there are scenarios where userspace applications need to explicitly
+control the rproc. In these cases, rproc also offers the file descriptors.
+
+The simplest API
+================
+
+Below set of api's can be used to start and stop the rproc
+where 'X' refers to instance of associated remoteproc. There can be systems
+where there are more than one rprocs such as multiple DSP's
+connected to application processors running Linux.
+::
+   echo start > /sys/class/remoteproc/remoteprocX/state
+   echo stop > /sys/class/remoteproc/remoteprocX/state
+
+To know the state of rproc:
+
+.. code-block::
+
+   cat /sys/class/remoteproc/remoteprocX/state
+
+
+To dynamically replace firmware, execute the following commands:
+
+.. code-block::
+
+   echo stop > /sys/class/remoteproc/remoteprocX/state
+   echo -n <firmware_name> >
+   /sys/class/remoteproc/remoteprocX/firmware
+   echo start > /sys/class/remoteproc/remoteprocX/state
+
+To simulate a remote crash, execute:
+
+.. code-block::
+
+   echo 1 > /sys/kernel/debug/remoteproc/remoteprocX/crash
+
+To get the trace logs, execute
+
+.. code-block::
+
+   cat /sys/kernel/debug/remoteproc/remoteprocX/crashX
+
+where X will be 0 or 1 if there are 2 resources. Also, this
+file will only exist if resources are defined in ELF firmware
+file.
+
+The coredump feature can be disabled with the following command:
+
+.. code-block::
+
+   echo disabled > /sys/kernel/debug/remoteproc/remoteprocX/coredump
+
+Userspace can also control start/stop of rproc by using a
+remoteproc Character Device, it can open the open a file descriptor
+and write `start` to initiate it, and `stop` to terminate it.
+
+[FIXME -- better explanations]
diff --git a/Documentation/remoteproc/rproc-kernel-api.rst b/Documentation/remoteproc/rproc-kernel-api.rst
new file mode 100644
index 000000000000..018c5bf9b3d7
--- /dev/null
+++ b/Documentation/remoteproc/rproc-kernel-api.rst
@@ -0,0 +1,239 @@
+=====================================================
+The Linux Remoteproc subsystem Driver Core kernel API
+=====================================================
+
+anish kumar <yesanishhere@gmail.com>
+
+Introduction
+------------
+This document does not describe what a Remote processor subsystem
+(RPROC) Driver or Device is. It also does not describe the API
+which can be used by user space to communicate with a RPROC driver.
+If you want to know this then please read the following
+file: Documentation/remoteproc/rproc-api.rst .
+
+So what does this document describe? It describes the API that can be used by
+remote processor Drivers that want to use the remote processor Driver Core
+Framework. This framework provides all interfacing towards user space so that
+the same code does not have to be reproduced each time. This also means that
+a remote processor driver then only needs to provide the different routines
+(operations) that control the remote processor.
+
+The API
+-------
+Each remote processor driver that wants to use the remote processor Driver Core
+must #include <linux/remoteproc.h> (you would have to do this anyway when
+writing a rproc device driver). This include file contains following
+register routine::
+
+	int devm_rproc_add(struct device *dev, struct rproc *rproc)
+
+The devm_rproc_add routine registers a remote processor device.
+The parameter of this routine is a pointer to a rproc device structure.
+This routine returns zero on success and a negative errno code for failure.
+
+The rproc device structure looks like this::
+
+  struct rproc {
+	struct list_head node;
+	struct iommu_domain *domain;
+	const char *name;
+	const char *firmware;
+	void *priv;
+	struct rproc_ops *ops;
+	struct device dev;
+	atomic_t power;
+	unsigned int state;
+	enum rproc_dump_mechanism dump_conf;
+	struct mutex lock;
+	struct dentry *dbg_dir;
+	struct list_head traces;
+	int num_traces;
+	struct list_head carveouts;
+	struct list_head mappings;
+	u64 bootaddr;
+	struct list_head rvdevs;
+	struct list_head subdevs;
+	struct idr notifyids;
+	int index;
+	struct work_struct crash_handler;
+	unsigned int crash_cnt;
+	bool recovery_disabled;
+	int max_notifyid;
+	struct resource_table *table_ptr;
+	struct resource_table *clean_table;
+	struct resource_table *cached_table;
+	size_t table_sz;
+	bool has_iommu;
+	bool auto_boot;
+	bool sysfs_read_only;
+	struct list_head dump_segments;
+	int nb_vdev;
+	u8 elf_class;
+	u16 elf_machine;
+	struct cdev cdev;
+	bool cdev_put_on_release;
+	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
+  };
+
+It contains following fields:
+
+* node: list node of this rproc object
+* domain: iommu domain
+* name: human readable name of the rproc
+* firmware: name of firmware file to be loaded
+* priv: private data which belongs to the platform-specific rproc module
+* ops: platform-specific start/stop rproc handlers
+* dev: virtual device for refcounting and common remoteproc behavior
+* power: refcount of users who need this rproc powered up
+* state: state of the device
+* dump_conf: Currently selected coredump configuration
+* lock: lock which protects concurrent manipulations of the rproc
+* dbg_dir: debugfs directory of this rproc device
+* traces: list of trace buffers
+* num_traces: number of trace buffers
+* carveouts: list of physically contiguous memory allocations
+* mappings: list of iommu mappings we initiated, needed on shutdown
+* bootaddr: address of first instruction to boot rproc with (optional)
+* rvdevs: list of remote virtio devices
+* subdevs: list of subdevices, to following the running state
+* notifyids: idr for dynamically assigning rproc-wide unique notify ids
+* index: index of this rproc device
+* crash_handler: workqueue for handling a crash
+* crash_cnt: crash counter
+* recovery_disabled: flag that state if recovery was disabled
+* max_notifyid: largest allocated notify id.
+* table_ptr: pointer to the resource table in effect
+* clean_table: copy of the resource table without modifications.  Used
+*      	 when a remote processor is attached or detached from the core
+* cached_table: copy of the resource table
+* table_sz: size of @cached_table
+* has_iommu: flag to indicate if remote processor is behind an MMU
+* auto_boot: flag to indicate if remote processor should be auto-started
+* sysfs_read_only: flag to make remoteproc sysfs files read only
+* dump_segments: list of segments in the firmware
+* nb_vdev: number of vdev currently handled by rproc
+* elf_class: firmware ELF class
+* elf_machine: firmware ELF machine
+* cdev: character device of the rproc
+* cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
+* features: indicate remoteproc features
+
+The list of rproc operations is defined as::
+
+  struct rproc_ops {
+	int (*prepare)(struct rproc *rproc);
+	int (*unprepare)(struct rproc *rproc);
+	int (*start)(struct rproc *rproc);
+	int (*stop)(struct rproc *rproc);
+	int (*attach)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
+	void (*kick)(struct rproc *rproc, int vqid);
+	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
+	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
+			  int offset, int avail);
+	struct resource_table *(*find_loaded_rsc_table)(
+				struct rproc *rproc, const struct firmware *fw);
+	struct resource_table *(*get_loaded_rsc_table)(
+				struct rproc *rproc, size_t *size);
+	int (*load)(struct rproc *rproc, const struct firmware *fw);
+	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
+	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	unsigned long (*panic)(struct rproc *rproc);
+	void (*coredump)(struct rproc *rproc);
+  };
+
+Most of the operations are optional. Currently in the implementation
+there are no mandatory operations, however from the practical standpoint
+minimum ops are:
+
+* start: this is a pointer to the routine that starts the remote processor
+  device.
+  The routine needs a pointer to the remote processor device structure as a
+  parameter. It returns zero on success or a negative errno code for failure.
+
+* stop: with this routine the remote processor device is being stopped.
+
+  The routine needs a pointer to the remote processor device structure as a
+  parameter. It returns zero on success or a negative errno code for failure.
+
+* da_to_va: this is the routine that needs to translate device address to
+  application processor virtual address that it can copy code to.
+
+  The routine needs a pointer to the remote processor device structure as a
+  parameter. It returns zero on success or a negative errno code for failure.
+
+  The routine provides the device address it finds in the ELF firmware and asks
+  the driver to convert that to virtual address.
+
+All other callbacks are optional in case of ELF provided firmware.
+
+* load: this is to load the firmware on to the remote device.
+
+  The routine needs firmware file that it needs to load on to the remote processor.
+  If the driver overrides this callback then default ELF loader will not get used.
+  Otherwise default framework provided loader gets used.
+
+  load = rproc_elf_load_segments;
+  parse_fw = rproc_elf_load_rsc_table;
+  find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
+  sanity_check = rproc_elf_sanity_check;
+  get_boot_addr = rproc_elf_get_boot_addr;
+
+* parse_fw: this routing parses the provided firmware. In case of ELF format,
+  framework provided rproc_elf_load_rsc_table function can be used.
+
+* sanity_check: Check the format of the firmware.
+
+* coredump: If the driver prefers to manage coredumps independently, it can
+  implement its own coredump handling. However, the framework offers a default
+  implementation for the ELF format by assigning this callback to
+  rproc_coredump, unless the driver has overridden it.
+
+* get_boot_addr: In case the bootaddr defined in ELF firmware is different, driver
+  can use this callback to set a different boot address for remote processor to
+  starts its reset vector from.
+
+* find_loaded_rsc_table: this routine gets the loaded resource table from the firmware.
+
+  resource table should have a section named (.resource_table) for the framework
+  to understand and interpret its content. Resource table is a way for remote
+  processor to ask for resources such as memory for dumping and logging. Look
+  at core documentation to know how to create the ELF section for the same.
+
+* get_loaded_rsc_table: Driver can customize passing the resource table by overriding
+  this callback. Framework doesn't provide any default implementation for the same.
+
+
+The rproc_report_crash function allows you to report a crash when crash is
+detected by the driver.
+
+::
+
+  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
+
+To add a subdev corresponding driver can call::
+
+  void rproc_add_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
+
+To remove a subdev, driver can call.
+
+::
+
+  void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
+
+To work with ELF coredump below function can be called::
+
+  void rproc_coredump_cleanup(struct rproc *rproc);
+  void rproc_coredump(struct rproc *rproc);
+  void rproc_coredump_using_sections(struct rproc *rproc);
+  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
+  int rproc_coredump_add_custom_segment(struct rproc *rproc,
+                                        dma_addr_t da, size_t size,
+                                        void (*dumpfn)(struct rproc *rproc,
+                                           struct rproc_dump_segment *segment,
+                                           void *dest, size_t offset,
+                                           size_t size),
+
+Remember that coredump functions provided by the framework only works with ELF format.
diff --git a/MAINTAINERS b/MAINTAINERS
index c0aa32970d07..b77d06e6325c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15907,6 +15907,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rproc-next
 F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/devicetree/bindings/remoteproc/
+F:      Documentation/remoteproc/
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
 F:	include/linux/remoteproc/
-- 
2.39.3 (Apple Git-146)

