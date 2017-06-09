Return-Path: <gregkh@linuxfoundation.org>
Subject: patch "rpmsg: use dev_groups and not dev_attrs for bus_type" added to driver-core-testing
From: <gregkh@linuxfoundation.org>
Date: Fri, 09 Jun 2017 11:01:02 +0200
Message-ID: <1496998862104245@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
To: gregkh@linuxfoundation.org, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com
List-ID: <linux-remoteproc@vger.kernel.org>


This is a note to let you know that I've just added the patch titled

    rpmsg: use dev_groups and not dev_attrs for bus_type

to my driver-core git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
in the driver-core-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the driver-core-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


>From 39afc7af152519cc3f41dfb4460701e7c00c3391 Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 6 Jun 2017 14:16:54 +0200
Subject: rpmsg: use dev_groups and not dev_attrs for bus_type

The dev_attrs field has long been "depreciated" and is finally being
removed, so move the driver to use the "correct" dev_groups field
instead for struct bus_type.

Cc: Ohad Ben-Cohen <ohad@wizery.com>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: <linux-remoteproc@vger.kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/rpmsg/rpmsg_core.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 600f5f9f7431..ad3d2a9df287 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -330,7 +330,8 @@ field##_show(struct device *dev,					\
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
 									\
 	return sprintf(buf, format_string, rpdev->path);		\
-}
+}									\
+static DEVICE_ATTR_RO(field);
 
 /* for more info, see Documentation/ABI/testing/sysfs-bus-rpmsg */
 rpmsg_show_attr(name, id.name, "%s\n");
@@ -345,15 +346,17 @@ static ssize_t modalias_show(struct device *dev,
 
 	return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
 }
-
-static struct device_attribute rpmsg_dev_attrs[] = {
-	__ATTR_RO(name),
-	__ATTR_RO(modalias),
-	__ATTR_RO(dst),
-	__ATTR_RO(src),
-	__ATTR_RO(announce),
-	__ATTR_NULL
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *rpmsg_dev_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_modalias.attr,
+	&dev_attr_dst.attr,
+	&dev_attr_src.attr,
+	&dev_attr_announce.attr,
+	NULL,
 };
+ATTRIBUTE_GROUPS(rpmsg_dev);
 
 /* rpmsg devices and drivers are matched using the service name */
 static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
@@ -455,7 +458,7 @@ static int rpmsg_dev_remove(struct device *dev)
 static struct bus_type rpmsg_bus = {
 	.name		= "rpmsg",
 	.match		= rpmsg_dev_match,
-	.dev_attrs	= rpmsg_dev_attrs,
+	.dev_groups	= rpmsg_dev_groups,
 	.uevent		= rpmsg_uevent,
 	.probe		= rpmsg_dev_probe,
 	.remove		= rpmsg_dev_remove,
-- 
2.13.1
