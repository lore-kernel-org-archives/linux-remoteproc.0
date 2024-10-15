Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74966AB8;
	Tue, 15 Oct 2024 02:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728961119; cv=none; b=pG1TS5foFsyeJ4HI7meGvtPjbZtnDn0PgxT/foRZIYfyYnjm5ZnWyR5HYDqzu5JSsqrm33GDef9lemKa7cZNe3cjFYCvLBe3YuVGJxczD3PKtSnMX6bT/KBR6owJMhSh2v4C4jxvoO3OorUaHGxy+6L25dFTMkqmEV2fz3LIX7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728961119; c=relaxed/simple;
	bh=MmOz6uFDmRq5pEY9XZK3lL6RC3uL3Ox19DjhGNHhsvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k7i3o9uIpdhl/pq8ehbYPQeWVs2jPXINuvyA5W+VWIXjojQ2hTZltektif3Mbo6WR/T+H+8mOeXs4xx7gOzhuOB75HwuHcxT0XSfFhXz0QFUFzeBRPJEenxaqZHSBxrUzj7gd+gAeVfd0K9h8J2ftIZlaPe8r8daEAivZtio3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0/IUZLb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0/IUZLb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c803787abso32804695ad.0;
        Mon, 14 Oct 2024 19:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728961116; x=1729565916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=woRA1+Z2QbNvRzWwYBLAK+Q0Dxqfyd9IGd0f3S/i3ps=;
        b=T0/IUZLbZNPEwRe9HGNanWPtS9/qmW0/JVBAUbJW2AH/3tPwkEd9C4wWoz7Bzgfwad
         JCKkDomcXVDnGWlF6/O0JH+RTu60j71KjxNea7eik665RVfol6CUY/IDNr/nzkcjPUFb
         o+rfowsZmb2O/i6TIZZNsg92AYZzbB+ncIqqrOjff67kHDWbAECdF8L3IPg69f9vDYw8
         d8buHu70UHYHaEBXFXVptQoFTx0T3wagkwmwGx/rUWyjaM9tL1G1MkoBbwtbpB8cZUU8
         fLprac6Rb8DN2+23VYmMELtx3gi7jujtae+brpCvx1gEHZrHQ/ea028vmQP+OTQD/r46
         S/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728961116; x=1729565916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woRA1+Z2QbNvRzWwYBLAK+Q0Dxqfyd9IGd0f3S/i3ps=;
        b=FZN5OcAH8fQytuRMjS468OHM3UVWIZ7hG37IXV3P/zGufEQnOnFLvfizRDLtbuPd4C
         PA14CHfdpM0bDJtN9Wluu100EjUja5u1GFItyv03M8FTzny47ULO3L5ih6GewQ1EKO0S
         HImcyWJFGogf/HRCM8MrtAS05na6wOJPyk6L2yYeMf+vjeMVx3LBoaXxOuYDP9xwSaoW
         /nup++e6QC+aWOjEai1JNAwDy8oR86mTweHZ9tq/wNNhpbddhYboHAZwaALRnIxyRQ6/
         GEw4vdNtHe6klDJ9c5fUINCOtu4p8WI4874yKn6owGI5cbvmv+e0yagl166TooRzGCgk
         4w7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp4nk0fiJKwMPJurWCDbICyq/SCBVfLhMgOFl9cBhuT6kskK9vKXOwujdHH/eBI1IyYtkL/ucUA1Onuyq2hiX5PQ==@vger.kernel.org, AJvYcCVVh4EMUVgT4Z/o8g799vJMt6rSB+0fNckafckLd0vSzx+ZXWNK/LawHfx0en2rxLJEIZyo8mQXSVD+75E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtT+wNQuzmIRRVRNKuWHdZ0JVU/G/XXy8tCloafEuxrAm+ZvK
	kVWlHYFbPSr+u4i6huHiAzbiubGFu9nYntsu8mOTSp/OEmM3+Gbu
X-Google-Smtp-Source: AGHT+IGpU2evB4hF4YglkiYpXvGMh574eJXqrVGjBUYheqm+KELXpDNFvV6SpNAEwSxvE0CJdCmOZg==
X-Received: by 2002:a17:902:d50e:b0:20c:7196:a1e9 with SMTP id d9443c01a7336-20ca0399c24mr185528365ad.13.1728961115295;
        Mon, 14 Oct 2024 19:58:35 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:d99c:8e8e:7d93:4250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f82c92sm2503365ad.45.2024.10.14.19.58.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Oct 2024 19:58:34 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.orgi,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH] remoteproc: Documentation: upgrade from staging.
Date: Mon, 14 Oct 2024 19:58:31 -0700
Message-Id: <20241015025831.65232-1-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the documentation in the mainline from
staging and add the relvant information from
current mainline.

Added:
1. userspace api documentation.
2. kernel api documentation.
3. Driver framework core details added.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/remoteproc/core.rst             | 252 ++++++++++++
 Documentation/remoteproc/index.rst            |  27 ++
 Documentation/remoteproc/rproc-api.rst        |  75 ++++
 Documentation/remoteproc/rproc-kernel-api.rst | 239 ++++++++++++
 Documentation/staging/index.rst               |   1 -
 Documentation/staging/remoteproc.rst          | 360 ------------------
 Documentation/staging/rpmsg.rst               |   2 +-
 7 files changed, 594 insertions(+), 362 deletions(-)
 create mode 100644 Documentation/remoteproc/core.rst
 create mode 100644 Documentation/remoteproc/index.rst
 create mode 100644 Documentation/remoteproc/rproc-api.rst
 create mode 100644 Documentation/remoteproc/rproc-kernel-api.rst
 delete mode 100644 Documentation/staging/remoteproc.rst

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
index 000000000000..8604f2b3e6b1
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
+file: Documentation/remotproc/remoteproc-api.rst .
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
diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
index 77bae5e5328b..d2c2b75fade8 100644
--- a/Documentation/staging/index.rst
+++ b/Documentation/staging/index.rst
@@ -9,7 +9,6 @@ Unsorted Documentation
    crc32
    lzo
    magic-number
-   remoteproc
    rpmsg
    speculation
    static-keys
diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
deleted file mode 100644
index 348ee7e508ac..000000000000
--- a/Documentation/staging/remoteproc.rst
+++ /dev/null
@@ -1,360 +0,0 @@
-==========================
-Remote Processor Framework
-==========================
-
-Introduction
-============
-
-Modern SoCs typically have heterogeneous remote processor devices in asymmetric
-multiprocessing (AMP) configurations, which may be running different instances
-of operating system, whether it's Linux or any other flavor of real-time OS.
-
-OMAP4, for example, has dual Cortex-A9, dual Cortex-M3 and a C64x+ DSP.
-In a typical configuration, the dual cortex-A9 is running Linux in a SMP
-configuration, and each of the other three cores (two M3 cores and a DSP)
-is running its own instance of RTOS in an AMP configuration.
-
-The remoteproc framework allows different platforms/architectures to
-control (power on, load firmware, power off) those remote processors while
-abstracting the hardware differences, so the entire driver doesn't need to be
-duplicated. In addition, this framework also adds rpmsg virtio devices
-for remote processors that supports this kind of communication. This way,
-platform-specific remoteproc drivers only need to provide a few low-level
-handlers, and then all rpmsg drivers will then just work
-(for more information about the virtio-based rpmsg bus and its drivers,
-please read Documentation/staging/rpmsg.rst).
-Registration of other types of virtio devices is now also possible. Firmwares
-just need to publish what kind of virtio devices do they support, and then
-remoteproc will add those devices. This makes it possible to reuse the
-existing virtio drivers with remote processor backends at a minimal development
-cost.
-
-User API
-========
-
-::
-
-  int rproc_boot(struct rproc *rproc)
-
-Boot a remote processor (i.e. load its firmware, power it on, ...).
-
-If the remote processor is already powered on, this function immediately
-returns (successfully).
-
-Returns 0 on success, and an appropriate error value otherwise.
-Note: to use this function you should already have a valid rproc
-handle. There are several ways to achieve that cleanly (devres, pdata,
-the way remoteproc_rpmsg.c does this, or, if this becomes prevalent, we
-might also consider using dev_archdata for this).
-
-::
-
-  int rproc_shutdown(struct rproc *rproc)
-
-Power off a remote processor (previously booted with rproc_boot()).
-In case @rproc is still being used by an additional user(s), then
-this function will just decrement the power refcount and exit,
-without really powering off the device.
-
-Returns 0 on success, and an appropriate error value otherwise.
-Every call to rproc_boot() must (eventually) be accompanied by a call
-to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
-
-.. note::
-
-  we're not decrementing the rproc's refcount, only the power refcount.
-  which means that the @rproc handle stays valid even after
-  rproc_shutdown() returns, and users can still use it with a subsequent
-  rproc_boot(), if needed.
-
-::
-
-  struct rproc *rproc_get_by_phandle(phandle phandle)
-
-Find an rproc handle using a device tree phandle. Returns the rproc
-handle on success, and NULL on failure. This function increments
-the remote processor's refcount, so always use rproc_put() to
-decrement it back once rproc isn't needed anymore.
-
-Typical usage
-=============
-
-::
-
-  #include <linux/remoteproc.h>
-
-  /* in case we were given a valid 'rproc' handle */
-  int dummy_rproc_example(struct rproc *my_rproc)
-  {
-	int ret;
-
-	/* let's power on and boot our remote processor */
-	ret = rproc_boot(my_rproc);
-	if (ret) {
-		/*
-		 * something went wrong. handle it and leave.
-		 */
-	}
-
-	/*
-	 * our remote processor is now powered on... give it some work
-	 */
-
-	/* let's shut it down now */
-	rproc_shutdown(my_rproc);
-  }
-
-API for implementors
-====================
-
-::
-
-  struct rproc *rproc_alloc(struct device *dev, const char *name,
-				const struct rproc_ops *ops,
-				const char *firmware, int len)
-
-Allocate a new remote processor handle, but don't register
-it yet. Required parameters are the underlying device, the
-name of this remote processor, platform-specific ops handlers,
-the name of the firmware to boot this rproc with, and the
-length of private data needed by the allocating rproc driver (in bytes).
-
-This function should be used by rproc implementations during
-initialization of the remote processor.
-
-After creating an rproc handle using this function, and when ready,
-implementations should then call rproc_add() to complete
-the registration of the remote processor.
-
-On success, the new rproc is returned, and on failure, NULL.
-
-.. note::
-
-  **never** directly deallocate @rproc, even if it was not registered
-  yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
-
-::
-
-  void rproc_free(struct rproc *rproc)
-
-Free an rproc handle that was allocated by rproc_alloc.
-
-This function essentially unrolls rproc_alloc(), by decrementing the
-rproc's refcount. It doesn't directly free rproc; that would happen
-only if there are no other references to rproc and its refcount now
-dropped to zero.
-
-::
-
-  int rproc_add(struct rproc *rproc)
-
-Register @rproc with the remoteproc framework, after it has been
-allocated with rproc_alloc().
-
-This is called by the platform-specific rproc implementation, whenever
-a new remote processor device is probed.
-
-Returns 0 on success and an appropriate error code otherwise.
-Note: this function initiates an asynchronous firmware loading
-context, which will look for virtio devices supported by the rproc's
-firmware.
-
-If found, those virtio devices will be created and added, so as a result
-of registering this remote processor, additional virtio drivers might get
-probed.
-
-::
-
-  int rproc_del(struct rproc *rproc)
-
-Unroll rproc_add().
-
-This function should be called when the platform specific rproc
-implementation decides to remove the rproc device. it should
-_only_ be called if a previous invocation of rproc_add()
-has completed successfully.
-
-After rproc_del() returns, @rproc is still valid, and its
-last refcount should be decremented by calling rproc_free().
-
-Returns 0 on success and -EINVAL if @rproc isn't valid.
-
-::
-
-  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
-
-Report a crash in a remoteproc
-
-This function must be called every time a crash is detected by the
-platform specific rproc implementation. This should not be called from a
-non-remoteproc driver. This function can be called from atomic/interrupt
-context.
-
-Implementation callbacks
-========================
-
-These callbacks should be provided by platform-specific remoteproc
-drivers::
-
-  /**
-   * struct rproc_ops - platform-specific device handlers
-   * @start:	power on the device and boot it
-   * @stop:	power off the device
-   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
-   */
-  struct rproc_ops {
-	int (*start)(struct rproc *rproc);
-	int (*stop)(struct rproc *rproc);
-	void (*kick)(struct rproc *rproc, int vqid);
-  };
-
-Every remoteproc implementation should at least provide the ->start and ->stop
-handlers. If rpmsg/virtio functionality is also desired, then the ->kick handler
-should be provided as well.
-
-The ->start() handler takes an rproc handle and should then power on the
-device and boot it (use rproc->priv to access platform-specific private data).
-The boot address, in case needed, can be found in rproc->bootaddr (remoteproc
-core puts there the ELF entry point).
-On success, 0 should be returned, and on failure, an appropriate error code.
-
-The ->stop() handler takes an rproc handle and powers the device down.
-On success, 0 is returned, and on failure, an appropriate error code.
-
-The ->kick() handler takes an rproc handle, and an index of a virtqueue
-where new message was placed in. Implementations should interrupt the remote
-processor and let it know it has pending messages. Notifying remote processors
-the exact virtqueue index to look in is optional: it is easy (and not
-too expensive) to go through the existing virtqueues and look for new buffers
-in the used rings.
-
-Binary Firmware Structure
-=========================
-
-At this point remoteproc supports ELF32 and ELF64 firmware binaries. However,
-it is quite expected that other platforms/devices which we'd want to
-support with this framework will be based on different binary formats.
-
-When those use cases show up, we will have to decouple the binary format
-from the framework core, so we can support several binary formats without
-duplicating common code.
-
-When the firmware is parsed, its various segments are loaded to memory
-according to the specified device address (might be a physical address
-if the remote processor is accessing memory directly).
-
-In addition to the standard ELF segments, most remote processors would
-also include a special section which we call "the resource table".
-
-The resource table contains system resources that the remote processor
-requires before it should be powered on, such as allocation of physically
-contiguous memory, or iommu mapping of certain on-chip peripherals.
-Remotecore will only power up the device after all the resource table's
-requirement are met.
-
-In addition to system resources, the resource table may also contain
-resource entries that publish the existence of supported features
-or configurations by the remote processor, such as trace buffers and
-supported virtio devices (and their configurations).
-
-The resource table begins with this header::
-
-  /**
-   * struct resource_table - firmware resource table header
-   * @ver: version number
-   * @num: number of resource entries
-   * @reserved: reserved (must be zero)
-   * @offset: array of offsets pointing at the various resource entries
-   *
-   * The header of the resource table, as expressed by this structure,
-   * contains a version number (should we need to change this format in the
-   * future), the number of available resource entries, and their offsets
-   * in the table.
-   */
-  struct resource_table {
-	u32 ver;
-	u32 num;
-	u32 reserved[2];
-	u32 offset[0];
-  } __packed;
-
-Immediately following this header are the resource entries themselves,
-each of which begins with the following resource entry header::
-
-  /**
-   * struct fw_rsc_hdr - firmware resource entry header
-   * @type: resource type
-   * @data: resource data
-   *
-   * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
-   * its @type. The content of the entry itself will immediately follow
-   * this header, and it should be parsed according to the resource type.
-   */
-  struct fw_rsc_hdr {
-	u32 type;
-	u8 data[0];
-  } __packed;
-
-Some resources entries are mere announcements, where the host is informed
-of specific remoteproc configuration. Other entries require the host to
-do something (e.g. allocate a system resource). Sometimes a negotiation
-is expected, where the firmware requests a resource, and once allocated,
-the host should provide back its details (e.g. address of an allocated
-memory region).
-
-Here are the various resource types that are currently supported::
-
-  /**
-   * enum fw_resource_type - types of resource entries
-   *
-   * @RSC_CARVEOUT:   request for allocation of a physically contiguous
-   *		    memory region.
-   * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
-   * @RSC_TRACE:	    announces the availability of a trace buffer into which
-   *		    the remote processor will be writing logs.
-   * @RSC_VDEV:       declare support for a virtio device, and serve as its
-   *		    virtio header.
-   * @RSC_LAST:       just keep this one at the end
-   * @RSC_VENDOR_START:	start of the vendor specific resource types range
-   * @RSC_VENDOR_END:	end of the vendor specific resource types range
-   *
-   * Please note that these values are used as indices to the rproc_handle_rsc
-   * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
-   * check the validity of an index before the lookup table is accessed, so
-   * please update it as needed.
-   */
-  enum fw_resource_type {
-	RSC_CARVEOUT		= 0,
-	RSC_DEVMEM		= 1,
-	RSC_TRACE		= 2,
-	RSC_VDEV		= 3,
-	RSC_LAST		= 4,
-	RSC_VENDOR_START	= 128,
-	RSC_VENDOR_END		= 512,
-  };
-
-For more details regarding a specific resource type, please see its
-dedicated structure in include/linux/remoteproc.h.
-
-We also expect that platform-specific resource entries will show up
-at some point. When that happens, we could easily add a new RSC_PLATFORM
-type, and hand those resources to the platform-specific rproc driver to handle.
-
-Virtio and remoteproc
-=====================
-
-The firmware should provide remoteproc information about virtio devices
-that it supports, and their configurations: a RSC_VDEV resource entry
-should specify the virtio device id (as in virtio_ids.h), virtio features,
-virtio config space, vrings information, etc.
-
-When a new remote processor is registered, the remoteproc framework
-will look for its resource table and will register the virtio devices
-it supports. A firmware may support any number of virtio devices, and
-of any type (a single remote processor can also easily support several
-rpmsg virtio devices this way, if desired).
-
-Of course, RSC_VDEV resource entries are only good enough for static
-allocation of virtio devices. Dynamic allocations will also be made possible
-using the rpmsg bus (similar to how we already do dynamic allocations of
-rpmsg channels; read more about it in rpmsg.txt).
diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 3713adaa1608..c1eb5343bf37 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -5,7 +5,7 @@ Remote Processor Messaging (rpmsg) Framework
 .. note::
 
   This document describes the rpmsg bus and how to write rpmsg drivers.
-  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
+  To learn how to add rpmsg support for new platforms, check out remoteproc
   (also a resident of Documentation/).
 
 Introduction
-- 
2.39.3 (Apple Git-146)

