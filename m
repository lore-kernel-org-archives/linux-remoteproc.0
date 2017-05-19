Return-Path: <mchehab@smtp.s-opensource.com>
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 07/29] remoteproc.txt: standardize document format
Date: Thu, 18 May 2017 22:25:51 -0300
Message-Id: <cde37a21ba554f06a806b7b88aeb8b1f535bee2a.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- mark document and section titles;
- adjust identation;
- mark literal blocks

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/remoteproc.txt | 320 +++++++++++++++++++++++++------------------
 1 file changed, 185 insertions(+), 135 deletions(-)

diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.txt
index f07597482351..77fb03acdbb4 100644
--- a/Documentation/remoteproc.txt
+++ b/Documentation/remoteproc.txt
@@ -1,6 +1,9 @@
+==========================
 Remote Processor Framework
+==========================
 
-1. Introduction
+Introduction
+============
 
 Modern SoCs typically have heterogeneous remote processor devices in asymmetric
 multiprocessing (AMP) configurations, which may be running different instances
@@ -26,44 +29,62 @@ remoteproc will add those devices. This makes it possible to reuse the
 existing virtio drivers with remote processor backends at a minimal development
 cost.
 
-2. User API
+User API
+========
+
+::
 
   int rproc_boot(struct rproc *rproc)
-    - Boot a remote processor (i.e. load its firmware, power it on, ...).
-      If the remote processor is already powered on, this function immediately
-      returns (successfully).
-      Returns 0 on success, and an appropriate error value otherwise.
-      Note: to use this function you should already have a valid rproc
-      handle. There are several ways to achieve that cleanly (devres, pdata,
-      the way remoteproc_rpmsg.c does this, or, if this becomes prevalent, we
-      might also consider using dev_archdata for this).
+
+Boot a remote processor (i.e. load its firmware, power it on, ...).
+
+If the remote processor is already powered on, this function immediately
+returns (successfully).
+
+Returns 0 on success, and an appropriate error value otherwise.
+Note: to use this function you should already have a valid rproc
+handle. There are several ways to achieve that cleanly (devres, pdata,
+the way remoteproc_rpmsg.c does this, or, if this becomes prevalent, we
+might also consider using dev_archdata for this).
+
+::
 
   void rproc_shutdown(struct rproc *rproc)
-    - Power off a remote processor (previously booted with rproc_boot()).
-      In case @rproc is still being used by an additional user(s), then
-      this function will just decrement the power refcount and exit,
-      without really powering off the device.
-      Every call to rproc_boot() must (eventually) be accompanied by a call
-      to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
-      Notes:
-      - we're not decrementing the rproc's refcount, only the power refcount.
-        which means that the @rproc handle stays valid even after
-        rproc_shutdown() returns, and users can still use it with a subsequent
-        rproc_boot(), if needed.
+
+Power off a remote processor (previously booted with rproc_boot()).
+In case @rproc is still being used by an additional user(s), then
+this function will just decrement the power refcount and exit,
+without really powering off the device.
+
+Every call to rproc_boot() must (eventually) be accompanied by a call
+to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
+
+.. note::
+
+  we're not decrementing the rproc's refcount, only the power refcount.
+  which means that the @rproc handle stays valid even after
+  rproc_shutdown() returns, and users can still use it with a subsequent
+  rproc_boot(), if needed.
+
+::
 
   struct rproc *rproc_get_by_phandle(phandle phandle)
-    - Find an rproc handle using a device tree phandle. Returns the rproc
-      handle on success, and NULL on failure. This function increments
-      the remote processor's refcount, so always use rproc_put() to
-      decrement it back once rproc isn't needed anymore.
 
-3. Typical usage
+Find an rproc handle using a device tree phandle. Returns the rproc
+handle on success, and NULL on failure. This function increments
+the remote processor's refcount, so always use rproc_put() to
+decrement it back once rproc isn't needed anymore.
 
-#include <linux/remoteproc.h>
+Typical usage
+=============
 
-/* in case we were given a valid 'rproc' handle */
-int dummy_rproc_example(struct rproc *my_rproc)
-{
+::
+
+  #include <linux/remoteproc.h>
+
+  /* in case we were given a valid 'rproc' handle */
+  int dummy_rproc_example(struct rproc *my_rproc)
+  {
 	int ret;
 
 	/* let's power on and boot our remote processor */
@@ -80,84 +101,111 @@ int dummy_rproc_example(struct rproc *my_rproc)
 
 	/* let's shut it down now */
 	rproc_shutdown(my_rproc);
-}
+  }
 
-4. API for implementors
+API for implementors
+====================
+
+::
 
   struct rproc *rproc_alloc(struct device *dev, const char *name,
 				const struct rproc_ops *ops,
 				const char *firmware, int len)
-    - Allocate a new remote processor handle, but don't register
-      it yet. Required parameters are the underlying device, the
-      name of this remote processor, platform-specific ops handlers,
-      the name of the firmware to boot this rproc with, and the
-      length of private data needed by the allocating rproc driver (in bytes).
-
-      This function should be used by rproc implementations during
-      initialization of the remote processor.
-      After creating an rproc handle using this function, and when ready,
-      implementations should then call rproc_add() to complete
-      the registration of the remote processor.
-      On success, the new rproc is returned, and on failure, NULL.
-
-      Note: _never_ directly deallocate @rproc, even if it was not registered
-      yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
+
+Allocate a new remote processor handle, but don't register
+it yet. Required parameters are the underlying device, the
+name of this remote processor, platform-specific ops handlers,
+the name of the firmware to boot this rproc with, and the
+length of private data needed by the allocating rproc driver (in bytes).
+
+This function should be used by rproc implementations during
+initialization of the remote processor.
+
+After creating an rproc handle using this function, and when ready,
+implementations should then call rproc_add() to complete
+the registration of the remote processor.
+
+On success, the new rproc is returned, and on failure, NULL.
+
+.. note::
+
+  **never** directly deallocate @rproc, even if it was not registered
+  yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
+
+::
 
   void rproc_free(struct rproc *rproc)
-    - Free an rproc handle that was allocated by rproc_alloc.
-      This function essentially unrolls rproc_alloc(), by decrementing the
-      rproc's refcount. It doesn't directly free rproc; that would happen
-      only if there are no other references to rproc and its refcount now
-      dropped to zero.
+
+Free an rproc handle that was allocated by rproc_alloc.
+
+This function essentially unrolls rproc_alloc(), by decrementing the
+rproc's refcount. It doesn't directly free rproc; that would happen
+only if there are no other references to rproc and its refcount now
+dropped to zero.
+
+::
 
   int rproc_add(struct rproc *rproc)
-    - Register @rproc with the remoteproc framework, after it has been
-      allocated with rproc_alloc().
-      This is called by the platform-specific rproc implementation, whenever
-      a new remote processor device is probed.
-      Returns 0 on success and an appropriate error code otherwise.
-      Note: this function initiates an asynchronous firmware loading
-      context, which will look for virtio devices supported by the rproc's
-      firmware.
-      If found, those virtio devices will be created and added, so as a result
-      of registering this remote processor, additional virtio drivers might get
-      probed.
+
+Register @rproc with the remoteproc framework, after it has been
+allocated with rproc_alloc().
+
+This is called by the platform-specific rproc implementation, whenever
+a new remote processor device is probed.
+
+Returns 0 on success and an appropriate error code otherwise.
+Note: this function initiates an asynchronous firmware loading
+context, which will look for virtio devices supported by the rproc's
+firmware.
+
+If found, those virtio devices will be created and added, so as a result
+of registering this remote processor, additional virtio drivers might get
+probed.
+
+::
 
   int rproc_del(struct rproc *rproc)
-    - Unroll rproc_add().
-      This function should be called when the platform specific rproc
-      implementation decides to remove the rproc device. it should
-      _only_ be called if a previous invocation of rproc_add()
-      has completed successfully.
 
-      After rproc_del() returns, @rproc is still valid, and its
-      last refcount should be decremented by calling rproc_free().
+Unroll rproc_add().
 
-      Returns 0 on success and -EINVAL if @rproc isn't valid.
+This function should be called when the platform specific rproc
+implementation decides to remove the rproc device. it should
+_only_ be called if a previous invocation of rproc_add()
+has completed successfully.
+
+After rproc_del() returns, @rproc is still valid, and its
+last refcount should be decremented by calling rproc_free().
+
+Returns 0 on success and -EINVAL if @rproc isn't valid.
+
+::
 
   void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
-    - Report a crash in a remoteproc
-      This function must be called every time a crash is detected by the
-      platform specific rproc implementation. This should not be called from a
-      non-remoteproc driver. This function can be called from atomic/interrupt
-      context.
 
-5. Implementation callbacks
+Report a crash in a remoteproc
+
+This function must be called every time a crash is detected by the
+platform specific rproc implementation. This should not be called from a
+non-remoteproc driver. This function can be called from atomic/interrupt
+context.
+
+Implementation callbacks
+========================
 
 These callbacks should be provided by platform-specific remoteproc
-drivers:
+drivers::
 
-/**
- * struct rproc_ops - platform-specific device handlers
- * @start:	power on the device and boot it
- * @stop:	power off the device
- * @kick:	kick a virtqueue (virtqueue id given as a parameter)
- */
-struct rproc_ops {
+  /**
+   * struct rproc_ops - platform-specific device handlers
+   * @start:	power on the device and boot it
+   * @stop:	power off the device
+   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
+   */
+  struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-};
+  };
 
 Every remoteproc implementation should at least provide the ->start and ->stop
 handlers. If rpmsg/virtio functionality is also desired, then the ->kick handler
@@ -179,7 +227,8 @@ the exact virtqueue index to look in is optional: it is easy (and not
 too expensive) to go through the existing virtqueues and look for new buffers
 in the used rings.
 
-6. Binary Firmware Structure
+Binary Firmware Structure
+=========================
 
 At this point remoteproc only supports ELF32 firmware binaries. However,
 it is quite expected that other platforms/devices which we'd want to
@@ -207,43 +256,43 @@ resource entries that publish the existence of supported features
 or configurations by the remote processor, such as trace buffers and
 supported virtio devices (and their configurations).
 
-The resource table begins with this header:
+The resource table begins with this header::
 
-/**
- * struct resource_table - firmware resource table header
- * @ver: version number
- * @num: number of resource entries
- * @reserved: reserved (must be zero)
- * @offset: array of offsets pointing at the various resource entries
- *
- * The header of the resource table, as expressed by this structure,
- * contains a version number (should we need to change this format in the
- * future), the number of available resource entries, and their offsets
- * in the table.
- */
-struct resource_table {
+  /**
+   * struct resource_table - firmware resource table header
+   * @ver: version number
+   * @num: number of resource entries
+   * @reserved: reserved (must be zero)
+   * @offset: array of offsets pointing at the various resource entries
+   *
+   * The header of the resource table, as expressed by this structure,
+   * contains a version number (should we need to change this format in the
+   * future), the number of available resource entries, and their offsets
+   * in the table.
+   */
+  struct resource_table {
 	u32 ver;
 	u32 num;
 	u32 reserved[2];
 	u32 offset[0];
-} __packed;
+  } __packed;
 
 Immediately following this header are the resource entries themselves,
-each of which begins with the following resource entry header:
+each of which begins with the following resource entry header::
 
-/**
- * struct fw_rsc_hdr - firmware resource entry header
- * @type: resource type
- * @data: resource data
- *
- * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
- * its @type. The content of the entry itself will immediately follow
- * this header, and it should be parsed according to the resource type.
- */
-struct fw_rsc_hdr {
+  /**
+   * struct fw_rsc_hdr - firmware resource entry header
+   * @type: resource type
+   * @data: resource data
+   *
+   * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
+   * its @type. The content of the entry itself will immediately follow
+   * this header, and it should be parsed according to the resource type.
+   */
+  struct fw_rsc_hdr {
 	u32 type;
 	u8 data[0];
-} __packed;
+  } __packed;
 
 Some resources entries are mere announcements, where the host is informed
 of specific remoteproc configuration. Other entries require the host to
@@ -252,32 +301,32 @@ is expected, where the firmware requests a resource, and once allocated,
 the host should provide back its details (e.g. address of an allocated
 memory region).
 
-Here are the various resource types that are currently supported:
+Here are the various resource types that are currently supported::
 
-/**
- * enum fw_resource_type - types of resource entries
- *
- * @RSC_CARVEOUT:   request for allocation of a physically contiguous
- *		    memory region.
- * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
- * @RSC_TRACE:	    announces the availability of a trace buffer into which
- *		    the remote processor will be writing logs.
- * @RSC_VDEV:       declare support for a virtio device, and serve as its
- *		    virtio header.
- * @RSC_LAST:       just keep this one at the end
- *
- * Please note that these values are used as indices to the rproc_handle_rsc
- * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
- * check the validity of an index before the lookup table is accessed, so
- * please update it as needed.
- */
-enum fw_resource_type {
+  /**
+   * enum fw_resource_type - types of resource entries
+   *
+   * @RSC_CARVEOUT:   request for allocation of a physically contiguous
+   *		    memory region.
+   * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
+   * @RSC_TRACE:	    announces the availability of a trace buffer into which
+   *		    the remote processor will be writing logs.
+   * @RSC_VDEV:       declare support for a virtio device, and serve as its
+   *		    virtio header.
+   * @RSC_LAST:       just keep this one at the end
+   *
+   * Please note that these values are used as indices to the rproc_handle_rsc
+   * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
+   * check the validity of an index before the lookup table is accessed, so
+   * please update it as needed.
+   */
+  enum fw_resource_type {
 	RSC_CARVEOUT	= 0,
 	RSC_DEVMEM	= 1,
 	RSC_TRACE	= 2,
 	RSC_VDEV	= 3,
 	RSC_LAST	= 4,
-};
+  };
 
 For more details regarding a specific resource type, please see its
 dedicated structure in include/linux/remoteproc.h.
@@ -286,7 +335,8 @@ We also expect that platform-specific resource entries will show up
 at some point. When that happens, we could easily add a new RSC_PLATFORM
 type, and hand those resources to the platform-specific rproc driver to handle.
 
-7. Virtio and remoteproc
+Virtio and remoteproc
+=====================
 
 The firmware should provide remoteproc information about virtio devices
 that it supports, and their configurations: a RSC_VDEV resource entry
-- 
2.9.4
