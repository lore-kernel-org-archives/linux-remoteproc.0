Return-Path: <jdelvare@suse.de>
Date: Mon, 5 Dec 2016 14:10:21 +0100
From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] remoteproc/ste: Delete unused driver
Message-ID: <20161205141021.2d9ada51@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Back in July 2014 I asked around what was the intended target
platform for the STE Modem remoteproc driver, so that I could add the
proper hardware dependency to its config option. The answer I got was
that there was no known publicly available hardware needing it and it
was unlikely that there ever would.

So I think it's time to delete this driver to lower the maintenance
burden.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/Kconfig           |   10 -
 drivers/remoteproc/Makefile          |    1=20
 drivers/remoteproc/ste_modem_rproc.c |  342 ------------------------------=
-----
 3 files changed, 353 deletions(-)

--- linux-4.9-rc7.orig/drivers/remoteproc/Kconfig	2016-12-05 14:05:22.55274=
1483 +0100
+++ linux-4.9-rc7/drivers/remoteproc/Kconfig	2016-12-05 14:06:25.477296774 =
+0100
@@ -31,16 +31,6 @@ config OMAP_REMOTEPROC
 	  It's safe to say n here if you're not interested in multimedia
 	  offloading or just want a bare minimum kernel.
=20
-config STE_MODEM_RPROC
-	tristate "STE-Modem remoteproc support"
-	depends on HAS_DMA
-	select REMOTEPROC
-	default n
-	help
-	  Say y or m here to support STE-Modem shared memory driver.
-	  This can be either built-in or a loadable module.
-	  If unsure say N.
-
 config WKUP_M3_RPROC
 	tristate "AMx3xx Wakeup M3 remoteproc support"
 	depends on SOC_AM33XX || SOC_AM43XX
--- linux-4.9-rc7.orig/drivers/remoteproc/Makefile	2016-11-08 15:01:12.2479=
24911 +0100
+++ linux-4.9-rc7/drivers/remoteproc/Makefile	2016-12-05 14:06:35.893388723=
 +0100
@@ -8,7 +8,6 @@ remoteproc-y				+=3D remoteproc_debugfs.o
 remoteproc-y				+=3D remoteproc_virtio.o
 remoteproc-y				+=3D remoteproc_elf_loader.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+=3D omap_remoteproc.o
-obj-$(CONFIG_STE_MODEM_RPROC)	 	+=3D ste_modem_rproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+=3D wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+=3D da8xx_remoteproc.o
 obj-$(CONFIG_QCOM_MDT_LOADER)		+=3D qcom_mdt_loader.o
--- linux-4.9-rc7.orig/drivers/remoteproc/ste_modem_rproc.c	2016-11-08 15:0=
1:12.248924922 +0100
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,342 +0,0 @@
-/*
- * Copyright (C) ST-Ericsson AB 2012
- * Author: Sjur Br=C3=A6ndeland <sjur.brandeland@stericsson.com>
- * License terms:  GNU General Public License (GPL), version 2
- */
-
-#include <linux/module.h>
-#include <linux/dma-mapping.h>
-#include <linux/remoteproc.h>
-#include <linux/ste_modem_shm.h>
-#include "remoteproc_internal.h"
-
-#define SPROC_FW_SIZE (50 * 4096)
-#define SPROC_MAX_TOC_ENTRIES 32
-#define SPROC_MAX_NOTIFY_ID 14
-#define SPROC_RESOURCE_NAME "rsc-table"
-#define SPROC_MODEM_NAME "ste-modem"
-#define SPROC_MODEM_FIRMWARE SPROC_MODEM_NAME "-fw.bin"
-
-#define sproc_dbg(sproc, fmt, ...) \
-	dev_dbg(&sproc->mdev->pdev.dev, fmt, ##__VA_ARGS__)
-#define sproc_err(sproc, fmt, ...) \
-	dev_err(&sproc->mdev->pdev.dev, fmt, ##__VA_ARGS__)
-
-/* STE-modem control structure */
-struct sproc {
-	struct rproc *rproc;
-	struct ste_modem_device *mdev;
-	int error;
-	void *fw_addr;
-	size_t fw_size;
-	dma_addr_t fw_dma_addr;
-};
-
-/* STE-Modem firmware entry */
-struct ste_toc_entry {
-	__le32 start;
-	__le32 size;
-	__le32 flags;
-	__le32 entry_point;
-	__le32 load_addr;
-	char name[12];
-};
-
-/*
- * The Table Of Content is located at the start of the firmware image and
- * at offset zero in the shared memory region. The resource table typically
- * contains the initial boot image (boot strap) and other information elem=
ents
- * such as remoteproc resource table. Each entry is identified by a unique
- * name.
- */
-struct ste_toc {
-	struct ste_toc_entry table[SPROC_MAX_TOC_ENTRIES];
-};
-
-/* Loads the firmware to shared memory. */
-static int sproc_load_segments(struct rproc *rproc, const struct firmware =
*fw)
-{
-	struct sproc *sproc =3D rproc->priv;
-
-	memcpy(sproc->fw_addr, fw->data, fw->size);
-
-	return 0;
-}
-
-/* Find the entry for resource table in the Table of Content */
-static const struct ste_toc_entry *sproc_find_rsc_entry(const void *data)
-{
-	int i;
-	const struct ste_toc *toc =3D data;
-
-	/* Search the table for the resource table */
-	for (i =3D 0; i < SPROC_MAX_TOC_ENTRIES &&
-		    toc->table[i].start !=3D 0xffffffff; i++) {
-		if (!strncmp(toc->table[i].name, SPROC_RESOURCE_NAME,
-			     sizeof(toc->table[i].name)))
-			return &toc->table[i];
-	}
-
-	return NULL;
-}
-
-/* Find the resource table inside the remote processor's firmware. */
-static struct resource_table *
-sproc_find_rsc_table(struct rproc *rproc, const struct firmware *fw,
-		     int *tablesz)
-{
-	struct sproc *sproc =3D rproc->priv;
-	struct resource_table *table;
-	const struct ste_toc_entry *entry;
-
-	if (!fw)
-		return NULL;
-
-	entry =3D sproc_find_rsc_entry(fw->data);
-	if (!entry) {
-		sproc_err(sproc, "resource table not found in fw\n");
-		return NULL;
-	}
-
-	table =3D (void *)(fw->data + entry->start);
-
-	/* sanity check size and offset of resource table */
-	if (entry->start > SPROC_FW_SIZE ||
-	    entry->size > SPROC_FW_SIZE ||
-	    fw->size > SPROC_FW_SIZE ||
-	    entry->start + entry->size > fw->size ||
-	    sizeof(struct resource_table) > entry->size) {
-		sproc_err(sproc, "bad size of fw or resource table\n");
-		return NULL;
-	}
-
-	/* we don't support any version beyond the first */
-	if (table->ver !=3D 1) {
-		sproc_err(sproc, "unsupported fw ver: %d\n", table->ver);
-		return NULL;
-	}
-
-	/* make sure reserved bytes are zeroes */
-	if (table->reserved[0] || table->reserved[1]) {
-		sproc_err(sproc, "non zero reserved bytes\n");
-		return NULL;
-	}
-
-	/* make sure the offsets array isn't truncated */
-	if (table->num > SPROC_MAX_TOC_ENTRIES ||
-	    table->num * sizeof(table->offset[0]) +
-	    sizeof(struct resource_table) > entry->size) {
-		sproc_err(sproc, "resource table incomplete\n");
-		return NULL;
-	}
-
-	/* If the fw size has grown, release the previous fw allocation */
-	if (SPROC_FW_SIZE < fw->size) {
-		sproc_err(sproc, "Insufficient space for fw (%d < %zd)\n",
-			  SPROC_FW_SIZE, fw->size);
-		return NULL;
-	}
-
-	sproc->fw_size =3D fw->size;
-	*tablesz =3D entry->size;
-
-	return table;
-}
-
-/* Find the resource table inside the remote processor's firmware. */
-static struct resource_table *
-sproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
-{
-	struct sproc *sproc =3D rproc->priv;
-	const struct ste_toc_entry *entry;
-
-	if (!fw || !sproc->fw_addr)
-		return NULL;
-
-	entry =3D sproc_find_rsc_entry(sproc->fw_addr);
-	if (!entry) {
-		sproc_err(sproc, "resource table not found in fw\n");
-		return NULL;
-	}
-
-	return sproc->fw_addr + entry->start;
-}
-
-/* STE modem firmware handler operations */
-static const struct rproc_fw_ops sproc_fw_ops =3D {
-	.load =3D sproc_load_segments,
-	.find_rsc_table =3D sproc_find_rsc_table,
-	.find_loaded_rsc_table =3D sproc_find_loaded_rsc_table,
-};
-
-/* Kick the modem with specified notification id */
-static void sproc_kick(struct rproc *rproc, int vqid)
-{
-	struct sproc *sproc =3D rproc->priv;
-
-	sproc_dbg(sproc, "kick vqid:%d\n", vqid);
-
-	/*
-	 * We need different notification IDs for RX and TX so add
-	 * an offset on TX notification IDs.
-	 */
-	sproc->mdev->ops.kick(sproc->mdev, vqid + SPROC_MAX_NOTIFY_ID);
-}
-
-/* Received a kick from a modem, kick the virtqueue */
-static void sproc_kick_callback(struct ste_modem_device *mdev, int vqid)
-{
-	struct sproc *sproc =3D mdev->drv_data;
-
-	if (rproc_vq_interrupt(sproc->rproc, vqid) =3D=3D IRQ_NONE)
-		sproc_dbg(sproc, "no message was found in vqid %d\n", vqid);
-}
-
-static struct ste_modem_dev_cb sproc_dev_cb =3D {
-	.kick =3D sproc_kick_callback,
-};
-
-/* Start the STE modem */
-static int sproc_start(struct rproc *rproc)
-{
-	struct sproc *sproc =3D rproc->priv;
-	int i, err;
-
-	sproc_dbg(sproc, "start ste-modem\n");
-
-	/* Sanity test the max_notifyid */
-	if (rproc->max_notifyid > SPROC_MAX_NOTIFY_ID) {
-		sproc_err(sproc, "Notification IDs too high:%d\n",
-			  rproc->max_notifyid);
-		return -EINVAL;
-	}
-
-	/* Subscribe to notifications */
-	for (i =3D 0; i <=3D rproc->max_notifyid; i++) {
-		err =3D sproc->mdev->ops.kick_subscribe(sproc->mdev, i);
-		if (err) {
-			sproc_err(sproc,
-				  "subscription of kicks failed:%d\n", err);
-			return err;
-		}
-	}
-
-	/* Request modem start-up*/
-	return sproc->mdev->ops.power(sproc->mdev, true);
-}
-
-/* Stop the STE modem */
-static int sproc_stop(struct rproc *rproc)
-{
-	struct sproc *sproc =3D rproc->priv;
-
-	sproc_dbg(sproc, "stop ste-modem\n");
-
-	return sproc->mdev->ops.power(sproc->mdev, false);
-}
-
-static struct rproc_ops sproc_ops =3D {
-	.start		=3D sproc_start,
-	.stop		=3D sproc_stop,
-	.kick		=3D sproc_kick,
-};
-
-/* STE modem device is unregistered */
-static int sproc_drv_remove(struct platform_device *pdev)
-{
-	struct ste_modem_device *mdev =3D
-		container_of(pdev, struct ste_modem_device, pdev);
-	struct sproc *sproc =3D mdev->drv_data;
-
-	sproc_dbg(sproc, "remove ste-modem\n");
-
-	/* Reset device callback functions */
-	sproc->mdev->ops.setup(sproc->mdev, NULL);
-
-	/* Unregister as remoteproc device */
-	rproc_del(sproc->rproc);
-	dma_free_coherent(sproc->rproc->dev.parent, SPROC_FW_SIZE,
-			  sproc->fw_addr, sproc->fw_dma_addr);
-	rproc_free(sproc->rproc);
-
-	mdev->drv_data =3D NULL;
-
-	return 0;
-}
-
-/* Handle probe of a modem device */
-static int sproc_probe(struct platform_device *pdev)
-{
-	struct ste_modem_device *mdev =3D
-		container_of(pdev, struct ste_modem_device, pdev);
-	struct sproc *sproc;
-	struct rproc *rproc;
-	int err;
-
-	dev_dbg(&mdev->pdev.dev, "probe ste-modem\n");
-
-	if (!mdev->ops.setup || !mdev->ops.kick || !mdev->ops.kick_subscribe ||
-	    !mdev->ops.power) {
-		dev_err(&mdev->pdev.dev, "invalid mdev ops\n");
-		return -EINVAL;
-	}
-
-	rproc =3D rproc_alloc(&mdev->pdev.dev, mdev->pdev.name, &sproc_ops,
-			    SPROC_MODEM_FIRMWARE, sizeof(*sproc));
-	if (!rproc)
-		return -ENOMEM;
-
-	sproc =3D rproc->priv;
-	sproc->mdev =3D mdev;
-	sproc->rproc =3D rproc;
-	rproc->has_iommu =3D false;
-	mdev->drv_data =3D sproc;
-
-	/* Provide callback functions to modem device */
-	sproc->mdev->ops.setup(sproc->mdev, &sproc_dev_cb);
-
-	/* Set the STE-modem specific firmware handler */
-	rproc->fw_ops =3D &sproc_fw_ops;
-
-	/*
-	 * STE-modem requires the firmware to be located
-	 * at the start of the shared memory region. So we need to
-	 * reserve space for firmware at the start.
-	 */
-	sproc->fw_addr =3D dma_alloc_coherent(rproc->dev.parent, SPROC_FW_SIZE,
-					    &sproc->fw_dma_addr,
-					    GFP_KERNEL);
-	if (!sproc->fw_addr) {
-		sproc_err(sproc, "Cannot allocate memory for fw\n");
-		err =3D -ENOMEM;
-		goto free_rproc;
-	}
-
-	/* Register as a remoteproc device */
-	err =3D rproc_add(rproc);
-	if (err)
-		goto free_mem;
-
-	return 0;
-
-free_mem:
-	dma_free_coherent(rproc->dev.parent, SPROC_FW_SIZE,
-			  sproc->fw_addr, sproc->fw_dma_addr);
-free_rproc:
-	/* Reset device data upon error */
-	mdev->drv_data =3D NULL;
-	rproc_free(rproc);
-	return err;
-}
-
-static struct platform_driver sproc_driver =3D {
-	.driver	=3D {
-		.name	=3D SPROC_MODEM_NAME,
-	},
-	.probe	=3D sproc_probe,
-	.remove	=3D sproc_drv_remove,
-};
-
-module_platform_driver(sproc_driver);
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("STE Modem driver using the Remote Processor Framework"=
);


--=20
Jean Delvare
SUSE L3 Support
