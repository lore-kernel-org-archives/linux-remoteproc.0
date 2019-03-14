Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from zimbra2.kalray.eu ([92.103.151.219]:32924 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfCNMY7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Mar 2019 08:24:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 29E6027E0446
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2019 13:24:57 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id qBUPcMwW3jJ6 for <linux-remoteproc@vger.kernel.org>;
        Thu, 14 Mar 2019 13:24:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 84C2A27E044C
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2019 13:24:56 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id wXNGUs_u_67L for <linux-remoteproc@vger.kernel.org>;
        Thu, 14 Mar 2019 13:24:56 +0100 (CET)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [192.168.40.202])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 6EF7727E0446
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2019 13:24:56 +0100 (CET)
Date: Thu, 14 Mar 2019 13:24:56 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <932594012.672697.1552566296415.JavaMail.zimbra@kalray.eu>
In-Reply-To: <2086042421.14120180.1551692458444.JavaMail.zimbra@kalray.eu>
References: <2086042421.14120180.1551692458444.JavaMail.zimbra@kalray.eu>
Subject: Re: [RFC PATCH] remoteproc: add per rproc resource handling
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

V2:
- Use vendor resources definitions from OpenAMP
- Call rproc->handle_rsc only for vendor resources
- Update remoteproc documentation


In order to allow rproc backend to handle vendor resources, add a
handle_rsc hook. This hook allow the rproc backends to handle vendor
resources as they like. The hook will be called only for vendor=20
resources and should return RSC_HANDLED on successful resource
handling, RSC_IGNORED if resource was ignored, or a negative value on
error.

Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@kalray.eu>
---
 Documentation/remoteproc.txt             | 14 +++++++++-----
 drivers/remoteproc/remoteproc_core.c     | 15 +++++++++++++++
 drivers/remoteproc/remoteproc_internal.h | 11 +++++++++++
 include/linux/remoteproc.h               | 31 +++++++++++++++++++++++++---=
---
 4 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.txt
index 77fb03acdbb4..03c3d2e568b0 100644
--- a/Documentation/remoteproc.txt
+++ b/Documentation/remoteproc.txt
@@ -314,6 +314,8 @@ Here are the various resource types that are currently =
supported::
    * @RSC_VDEV:       declare support for a virtio device, and serve as it=
s
    *=09=09    virtio header.
    * @RSC_LAST:       just keep this one at the end
+   * @RSC_VENDOR_START:=09start of the vendor specific resource types rang=
e
+   * @RSC_VENDOR_END:=09end of the vendor specific resource types range
    *
    * Please note that these values are used as indices to the rproc_handle=
_rsc
    * lookup table, so please keep them sane. Moreover, @RSC_LAST is used t=
o
@@ -321,11 +323,13 @@ Here are the various resource types that are currentl=
y supported::
    * please update it as needed.
    */
   enum fw_resource_type {
-=09RSC_CARVEOUT=09=3D 0,
-=09RSC_DEVMEM=09=3D 1,
-=09RSC_TRACE=09=3D 2,
-=09RSC_VDEV=09=3D 3,
-=09RSC_LAST=09=3D 4,
+=09RSC_CARVEOUT=09=09=3D 0,
+=09RSC_DEVMEM=09=09=3D 1,
+=09RSC_TRACE=09=09=3D 2,
+=09RSC_VDEV=09=09=3D 3,
+=09RSC_LAST=09=09=3D 4,
+=09RSC_VENDOR_START=09=3D 128,
+=09RSC_VENDOR_END=09=09=3D 512,
   };
=20
 For more details regarding a specific resource type, please see its
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remo=
teproc_core.c
index 54ec38fc5dca..0618656a6160 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1009,6 +1009,21 @@ static int rproc_handle_resources(struct rproc *rpro=
c,
=20
 =09=09dev_dbg(dev, "rsc: type %d\n", hdr->type);
=20
+=09=09if (hdr->type >=3D RSC_VENDOR_START &&
+=09=09    hdr->type <=3D RSC_VENDOR_END) {
+=09=09=09ret =3D rproc_handle_rsc(rproc, hdr->type, rsc,
+=09=09=09=09=09       offset + sizeof(*hdr), avail);
+=09=09=09if (ret =3D=3D RSC_HANDLED) {
+=09=09=09=09continue;
+=09=09=09} else if (ret < 0) {
+=09=09=09=09break;
+=09=09=09}
+
+=09=09=09dev_warn(dev, "unsupported vendor resource %d\n",
+=09=09=09=09 hdr->type);
+=09=09=09continue;
+=09=09}
+
 =09=09if (hdr->type >=3D RSC_LAST) {
 =09=09=09dev_warn(dev, "unsupported resource %d\n", hdr->type);
 =09=09=09continue;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/=
remoteproc_internal.h
index f6cad243d7ca..b02b15f74a5e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -98,6 +98,17 @@ static inline int rproc_parse_fw(struct rproc *rproc, co=
nst struct firmware *fw)
 =09return 0;
 }
=20
+static inline
+int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int off=
set,
+=09=09     int avail)
+{
+=09if (rproc->ops->handle_rsc)
+=09=09return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
+=09=09=09=09=09      avail);
+
+=09return RSC_IGNORED;
+}
+
 static inline
 struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 =09=09=09=09=09=09   const struct firmware *fw)
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 507a2b524208..a3edd981220e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -100,7 +100,9 @@ struct fw_rsc_hdr {
  *=09=09    the remote processor will be writing logs.
  * @RSC_VDEV:       declare support for a virtio device, and serve as its
  *=09=09    virtio header.
- * @RSC_LAST:       just keep this one at the end
+ * @RSC_LAST:       just keep this one at the end of standard resources
+ * @RSC_VENDOR_START:=09start of the vendor specific resource types range
+ * @RSC_VENDOR_END:=09end of the vendor specific resource types range
  *
  * For more details regarding a specific resource type, please see its
  * dedicated structure below.
@@ -111,11 +113,13 @@ struct fw_rsc_hdr {
  * please update it as needed.
  */
 enum fw_resource_type {
-=09RSC_CARVEOUT=09=3D 0,
-=09RSC_DEVMEM=09=3D 1,
-=09RSC_TRACE=09=3D 2,
-=09RSC_VDEV=09=3D 3,
-=09RSC_LAST=09=3D 4,
+=09RSC_CARVEOUT=09=09=3D 0,
+=09RSC_DEVMEM=09=09=3D 1,
+=09RSC_TRACE=09=09=3D 2,
+=09RSC_VDEV=09=09=3D 3,
+=09RSC_LAST=09=09=3D 4,
+=09RSC_VENDOR_START=09=3D 128,
+=09RSC_VENDOR_END=09=09=3D 512,
 };
=20
 #define FW_RSC_ADDR_ANY (-1)
@@ -339,12 +343,25 @@ struct rproc_mem_entry {
=20
 struct firmware;
=20
+/**
+ * enum rsc_handling_status - return status of rproc_ops handle_rsc hook
+ * @RSC_HANDLED:=09resource was handled
+ * @RSC_IGNORED:=09resource was ignored
+ */
+enum rsc_handling_status {
+=09RSC_HANDLED=09=3D 0,
+=09RSC_IGNORED=09=3D 1,
+};
+
 /**
  * struct rproc_ops - platform-specific device handlers
  * @start:=09power on the device and boot it
  * @stop:=09power off the device
  * @kick:=09kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:=09optional platform hook to perform address translations
+ * @handle_rsc:=09optional platform hook to handle vendor resources. Shoul=
d return
+ * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
+ * negative value on error
  * @load_rsc_table:=09load resource table from firmware image
  * @find_loaded_rsc_table: find the loaded resouce table
  * @load:=09=09load firmeware to memory, where the remote processor
@@ -358,6 +375,8 @@ struct rproc_ops {
 =09void (*kick)(struct rproc *rproc, int vqid);
 =09void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
 =09int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
+=09int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
+=09=09=09  int offset, int avail);
 =09struct resource_table *(*find_loaded_rsc_table)(
 =09=09=09=09struct rproc *rproc, const struct firmware *fw);
 =09int (*load)(struct rproc *rproc, const struct firmware *fw);
--=20
2.15.0.276.g89ea799

----- Mail original -----
De: "Cl=C3=A9ment Leger" <cleger@kalray.eu>
=C3=80: "linux-remoteproc" <linux-remoteproc@vger.kernel.org>
Envoy=C3=A9: Lundi 4 Mars 2019 10:40:58
Objet: [RFC PATCH] remoteproc: add per rproc resource handling

In order to allow rproc backend to handle vendor resources, add a
handle_rsc hook. This hook allow the rproc backends to handle vendor
resources as they like. It also allows them to parse standard RSC_*
if needed. The hook should return RSC_HANDLED on successful resource
handling, RSC_IGNORED if resource was ignored, or a negative value on
error.

---
 drivers/remoteproc/remoteproc_core.c     |  7 +++++++
 drivers/remoteproc/remoteproc_internal.h | 11 +++++++++++
 include/linux/remoteproc.h               | 15 +++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remo=
teproc_core.c
index 54ec38fc5dca..36a0f3c59ac1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1009,6 +1009,13 @@ static int rproc_handle_resources(struct rproc *rpro=
c,
=20
 =09=09dev_dbg(dev, "rsc: type %d\n", hdr->type);
=20
+=09=09ret =3D rproc_handle_rsc(rproc, hdr->type, rsc,
+=09=09=09=09       offset + sizeof(*hdr), avail);
+=09=09if (ret =3D=3D RSC_HANDLED)
+=09=09=09continue;
+=09=09else if (ret < 0)
+=09=09=09break;
+
 =09=09if (hdr->type >=3D RSC_LAST) {
 =09=09=09dev_warn(dev, "unsupported resource %d\n", hdr->type);
 =09=09=09continue;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/=
remoteproc_internal.h
index f6cad243d7ca..b02b15f74a5e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -98,6 +98,17 @@ static inline int rproc_parse_fw(struct rproc *rproc, co=
nst struct firmware *fw)
 =09return 0;
 }
=20
+static inline
+int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int off=
set,
+=09=09     int avail)
+{
+=09if (rproc->ops->handle_rsc)
+=09=09return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
+=09=09=09=09=09      avail);
+
+=09return RSC_IGNORED;
+}
+
 static inline
 struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 =09=09=09=09=09=09   const struct firmware *fw)
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 507a2b524208..fb9751717da7 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -339,12 +339,25 @@ struct rproc_mem_entry {
=20
 struct firmware;
=20
+/**
+ * enum rsc_handling_status - return status of rproc_ops handle_rsc hook
+ * @RSC_HANDLED:=09resource was handled
+ * @RSC_IGNORED:=09resource was ignored
+ */
+enum rsc_handling_status {
+=09RSC_HANDLED=09=3D 0,
+=09RSC_IGNORED=09=3D 1,
+};
+
 /**
  * struct rproc_ops - platform-specific device handlers
  * @start:=09power on the device and boot it
  * @stop:=09power off the device
  * @kick:=09kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:=09optional platform hook to perform address translations
+ * @handle_rsc:=09optional platform hook to handle vendor resources. Shoul=
d return
+ * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
+ * negative value on error
  * @load_rsc_table:=09load resource table from firmware image
  * @find_loaded_rsc_table: find the loaded resouce table
  * @load:=09=09load firmeware to memory, where the remote processor
@@ -358,6 +371,8 @@ struct rproc_ops {
 =09void (*kick)(struct rproc *rproc, int vqid);
 =09void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
 =09int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
+=09int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
+=09=09=09  int offset, int avail);
 =09struct resource_table *(*find_loaded_rsc_table)(
 =09=09=09=09struct rproc *rproc, const struct firmware *fw);
 =09int (*load)(struct rproc *rproc, const struct firmware *fw);
--=20
2.15.0.276.g89ea799
