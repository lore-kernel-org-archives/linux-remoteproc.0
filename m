Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [RFC v2 5/5] remoteproc: srm: introduce dynamic resource manager
Date: Wed, 27 Jun 2018 10:06:22 +0200
Message-ID: <1530086782-5046-6-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1530086782-5046-1-git-send-email-fabien.dessenne@st.com>
References: <1530086782-5046-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>, Oleksij
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>, Alex Elder <elder@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The dynamic resource manager allows the remote processor to configure
the system resources that were statically allocated and setup before
the processor was started.

It relies on an rpmsg link and offers the remote processor the ability
to get and set the following configurations:
- Clock enable / disable
- Clock rate
- Regulator enable / disable
- Regulator voltage (min/max, current)
- Pin state configuration
The proposed implementation allows to extend the list of resources and
configurations.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/rproc_srm_core.c | 124 +++++++--
 drivers/remoteproc/rproc_srm_core.h | 113 ++++++++
 drivers/remoteproc/rproc_srm_dev.c  | 518 +++++++++++++++++++++++++++++-------
 3 files changed, 639 insertions(+), 116 deletions(-)
 create mode 100644 drivers/remoteproc/rproc_srm_core.h

diff --git a/drivers/remoteproc/rproc_srm_core.c b/drivers/remoteproc/rproc_srm_core.c
index 29fcc73..55eb13b 100644
--- a/drivers/remoteproc/rproc_srm_core.c
+++ b/drivers/remoteproc/rproc_srm_core.c
@@ -1,20 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author: Fabien Dessenne <fabien.dessenne@st.com>.
- *
- * License type: GPLv2
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
- * or FITNESS FOR A PARTICULAR PURPOSE.
- * See the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program. If not, see <http://www.gnu.org/licenses/>.
+ * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
+ * Author: Fabien Dessenne <fabien.dessenne@st.com> for STMicroelectronics.
  */
 
 #include <linux/component.h>
@@ -22,6 +9,9 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+
+#include "rproc_srm_core.h"
 
 #define BIND_TIMEOUT 10000
 
@@ -31,10 +21,98 @@ struct rproc_srm_core {
 	int bind_status;
 	atomic_t prepared;
 	struct rproc_subdev subdev;
+	struct rpmsg_driver rpdrv;
+	struct blocking_notifier_head notifier;
 };
 
 #define to_rproc_srm_core(s) container_of(s, struct rproc_srm_core, subdev)
 
+static struct rproc_srm_core *rpmsg_srm_to_core(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_driver *rpdrv;
+	struct rproc_srm_core *core;
+
+	rpdrv = container_of(rpdev->dev.driver, struct rpmsg_driver, drv);
+	core = container_of(rpdrv, struct rproc_srm_core, rpdrv);
+
+	return core;
+}
+
+int rpmsg_srm_send(struct rpmsg_endpoint *ept, struct rpmsg_srm_msg *msg)
+{
+	int ret;
+
+	ret = rpmsg_send(ept, (void *)msg, sizeof(*msg));
+	if (ret)
+		dev_err(&ept->rpdev->dev, "rpmsg_send failed: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(rpmsg_srm_send);
+
+static int rpmsg_srm_cb(struct rpmsg_device *rpdev, void *data, int len,
+			void *priv, u32 src)
+{
+	struct rproc_srm_core *core = rpmsg_srm_to_core(rpdev);
+	struct rpmsg_srm_msg_desc desc;
+	int ret;
+
+	desc.ept = rpdev->ept;
+	desc.msg = data;
+
+	ret = blocking_notifier_call_chain(&core->notifier, 0, &desc);
+
+	if (!(ret & NOTIFY_STOP_MASK)) {
+		dev_warn(&rpdev->dev, "unknown device\n");
+		desc.msg->message_type = RPROC_SRM_MSG_ERROR;
+		rpmsg_srm_send(desc.ept, desc.msg);
+	}
+
+	return 0;
+}
+
+static int rpmsg_srm_probe(struct rpmsg_device *rpdev)
+{
+	/* Note : the probe ops is mandatory */
+	dev_dbg(&rpdev->dev, "%s\n", __func__);
+
+	return 0;
+}
+
+static void rpmsg_srm_remove(struct rpmsg_device *rpdev)
+{
+	/* Note : the remove ops is mandatory */
+	dev_dbg(&rpdev->dev, "%s\n", __func__);
+}
+
+static struct rpmsg_device_id rpmsg_srm_id_table[] = {
+	{ .name	= "rproc-srm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_srm_id_table);
+
+static struct rpmsg_driver rpmsg_srm_drv = {
+	.drv.name	= "rpmsg_srm",
+	.id_table	= rpmsg_srm_id_table,
+	.probe		= rpmsg_srm_probe,
+	.callback	= rpmsg_srm_cb,
+	.remove		= rpmsg_srm_remove,
+};
+
+int rproc_srm_core_register_notifier(struct rproc_srm_core *core,
+				     struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&core->notifier, nb);
+}
+EXPORT_SYMBOL(rproc_srm_core_register_notifier);
+
+int rproc_srm_core_unregister_notifier(struct rproc_srm_core *core,
+				       struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&core->notifier, nb);
+}
+EXPORT_SYMBOL(rproc_srm_core_unregister_notifier);
+
 static int compare_of(struct device *dev, void *data)
 {
 	return dev->of_node == data;
@@ -115,6 +193,15 @@ static int rproc_srm_core_prepare(struct rproc_subdev *subdev)
 		dev_err(dev, "failed to bind\n");
 		goto master;
 	}
+
+	/* Register rpmsg driver for dynamic management */
+	rproc_srm_core->rpdrv = rpmsg_srm_drv;
+	ret = register_rpmsg_driver(&rproc_srm_core->rpdrv);
+	if (ret) {
+		dev_err(dev, "failed to register rpmsg drv\n");
+		goto master;
+	}
+
 done:
 	atomic_inc(&rproc_srm_core->prepared);
 
@@ -127,7 +214,7 @@ static int rproc_srm_core_prepare(struct rproc_subdev *subdev)
 	return ret;
 }
 
-static void rproc_srm_core_do_unprepare(struct rproc_subdev *subdev)
+static void rproc_srm_core_unprepare(struct rproc_subdev *subdev)
 {
 	struct rproc_srm_core *rproc_srm_core = to_rproc_srm_core(subdev);
 	struct device *dev = rproc_srm_core->dev;
@@ -136,6 +223,8 @@ static void rproc_srm_core_do_unprepare(struct rproc_subdev *subdev)
 
 	atomic_dec(&rproc_srm_core->prepared);
 
+	unregister_rpmsg_driver(&rproc_srm_core->rpdrv);
+
 	component_master_del(dev, &srm_comp_ops);
 	devm_of_platform_depopulate(dev);
 }
@@ -154,6 +243,7 @@ static int rproc_srm_core_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rproc_srm_core->dev = dev;
+	BLOCKING_INIT_NOTIFIER_HEAD(&rproc_srm_core->notifier);
 
 	/* Register rproc subdevice with (un)prepare ops */
 	rproc_srm_core->subdev.prepare = rproc_srm_core_prepare;
diff --git a/drivers/remoteproc/rproc_srm_core.h b/drivers/remoteproc/rproc_srm_core.h
new file mode 100644
index 0000000..7fe8a23
--- /dev/null
+++ b/drivers/remoteproc/rproc_srm_core.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
+ * Author: Fabien Dessenne <fabien.dessenne@st.com> for STMicroelectronics.
+ */
+
+#ifndef _RPROC_SRM_CORE_H_
+#define _RPROC_SRM_CORE_H_
+
+/**
+ * Message type used in resource manager rpmsg:
+ *  RPROC_SRM_MSG_GETCONFIG:    Request to get the configuration of a resource
+ *  RPROC_SRM_MSG_SETCONFIG:    Request to set the configuration of a resource
+ *  RPROC_SRM_MSG_ERROR:        Error when processing a request
+ */
+#define RPROC_SRM_MSG_GETCONFIG 0x00
+#define RPROC_SRM_MSG_SETCONFIG 0x01
+#define RPROC_SRM_MSG_ERROR     0xFF
+
+/**
+ * Resource type used in resource manager rpmsg:
+ *  RPROC_SRM_RSC_CLOCK:        clock resource
+ *  RPROC_SRM_RSC_PIN:          pin resource
+ *  RPROC_SRM_RSC_REGU:         regulator resource
+ */
+#define RPROC_SRM_RSC_CLOCK     0x00
+#define RPROC_SRM_RSC_PIN       0x01
+#define RPROC_SRM_RSC_REGU      0x02
+
+/**
+ * struct clock_cfg - clock configuration used in resource manager rpmsg
+ * @index:      clock index
+ * @name:       clock name
+ * @enable:     clock enable/disable request (in SetConfig message) or current
+ *              status (in GetConfig message)
+ * @rate:       clock rate request (in SetConfig message) or current status (in
+ *              GetConfig message)
+ */
+struct clock_cfg {
+	u32 index;
+	u8 name[16];
+	u32 enable;
+	u32 rate;
+};
+
+/**
+ * struct regu_cfg - regu configuration used in resource manager rpmsg
+ * @index:      regulator index
+ * @name:       regulator name
+ * @enable:     regulator enable/disable request (in SetConfig message) or
+ *              current status (in GetConfig message)
+ * @curr_voltage_mv: current regulator voltage in mV (meaningful in
+ *                   SetConfig message)
+ * @min_voltage_mv:  regulator min voltage request in mV (meaningful in
+ *                   SetConfig message)
+ * @max_voltage_mv:  regulator max voltage request in mV (meaningful in
+ *                   SetConfig message)
+ */
+struct regu_cfg {
+	u32 index;
+	u8 name[16];
+	u32 enable;
+	u32 curr_voltage_mv;
+	u32 min_voltage_mv;
+	u32 max_voltage_mv;
+};
+
+/**
+ * struct pin_cfg - pin configuration used in resource manager rpmsg
+ * @name:       current pin configuration name (meaningful in GetConfig message)
+ */
+struct pin_cfg {
+	u8 name[16];
+};
+
+/**
+ * struct rpmsg_srm_msg - message structure used between processors to
+ *                        dynamically update resources configuration
+ * @message_type: type of the message: see RPROC_SRM_MSG*
+ * @device_id:  an identifier specifying the device owning the resources.
+ *              This is implementation dependent. As example it may be the
+ *              device name or the device address.
+ * @rsc_type:   the type of the resource for which the configuration applies:
+ *              see RPROC_SRM_RSC*
+ * @clock_cfg:  clock config - relevant if &rsc_type is RPROC_SRM_RSC_CLOCK
+ * @regu_cfg:   regulator config - relevant if &rsc_type is RPROC_SRM_RSC_REGU
+ * @pin_cfg:    pin config - relevant if &rsc_type is RPROC_SRM_RSC_PIN
+ */
+struct rpmsg_srm_msg {
+	u32 message_type;
+	u8 device_id[32];
+	u32 rsc_type;
+	union {
+		struct clock_cfg clock_cfg;
+		struct regu_cfg regu_cfg;
+		struct pin_cfg pin_cfg;
+	};
+};
+
+struct rpmsg_srm_msg_desc {
+	struct rpmsg_endpoint *ept;
+	struct rpmsg_srm_msg *msg;
+};
+
+struct rproc_srm_core;
+
+int rproc_srm_core_register_notifier(struct rproc_srm_core *core,
+				     struct notifier_block *nb);
+int rproc_srm_core_unregister_notifier(struct rproc_srm_core *core,
+				       struct notifier_block *nb);
+int rpmsg_srm_send(struct rpmsg_endpoint *ept, struct rpmsg_srm_msg *msg);
+
+#endif
diff --git a/drivers/remoteproc/rproc_srm_dev.c b/drivers/remoteproc/rproc_srm_dev.c
index 4b2e6ac..b3ed733 100644
--- a/drivers/remoteproc/rproc_srm_dev.c
+++ b/drivers/remoteproc/rproc_srm_dev.c
@@ -1,20 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author: Fabien Dessenne <fabien.dessenne@st.com>.
- *
- * License type: GPLv2
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
- * or FITNESS FOR A PARTICULAR PURPOSE.
- * See the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program. If not, see <http://www.gnu.org/licenses/>.
+ * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
+ * Author: Fabien Dessenne <fabien.dessenne@st.com> for STMicroelectronics.
  */
 
 #include <linux/clk.h>
@@ -29,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
-#define SUPPLY_SUFFIX   "-supply"
+#include "rproc_srm_core.h"
 
 struct rproc_srm_clk_info {
 	struct list_head list;
@@ -43,6 +30,7 @@ struct rproc_srm_pin_info {
 	struct list_head list;
 	unsigned int index;
 	char *name;
+	bool selected;
 };
 
 struct rproc_srm_regu_info {
@@ -63,6 +51,8 @@ struct rproc_srm_irq_info {
 
 struct rproc_srm_dev {
 	struct device *dev;
+	struct rproc_srm_core *core;
+	struct notifier_block nb;
 	struct pinctrl *pctrl;
 
 	struct list_head clk_list_head;
@@ -71,17 +61,16 @@ struct rproc_srm_dev {
 	struct list_head irq_list_head;
 };
 
-/* irqs */
-static void rproc_srm_dev_put_irqs(struct rproc_srm_dev *rproc_srm_dev)
+/* Irqs */
+static void rproc_srm_dev_irqs_put(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
-	struct rproc_srm_irq_info *info, *tmp;
-	struct list_head *irq_head = &rproc_srm_dev->irq_list_head;
+	struct rproc_srm_irq_info *i, *tmp;
 
-	list_for_each_entry_safe(info, tmp, irq_head, list) {
-		devm_free_irq(dev, info->irq, NULL);
-		dev_dbg(dev, "Put irq %d (%s)\n", info->irq, info->name);
-		list_del(&info->list);
+	list_for_each_entry_safe(i, tmp, &rproc_srm_dev->irq_list_head, list) {
+		devm_free_irq(dev, i->irq, NULL);
+		dev_dbg(dev, "Put irq %d (%s)\n", i->irq, i->name);
+		list_del(&i->list);
 	}
 }
 
@@ -91,13 +80,12 @@ static irqreturn_t rproc_srm_dev_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int rproc_srm_dev_get_irqs(struct rproc_srm_dev *rproc_srm_dev)
+static int rproc_srm_dev_irqs_get(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
 	struct rproc_srm_irq_info *info;
-	struct list_head *irq_head = &rproc_srm_dev->irq_list_head;
 	const char *name;
 	int nr, ret, irq;
 	unsigned int i;
@@ -141,87 +129,166 @@ static int rproc_srm_dev_get_irqs(struct rproc_srm_dev *rproc_srm_dev)
 		 */
 		irq_set_status_flags(info->irq, IRQ_DISABLE_UNLAZY);
 
+		/* Note: "interrupt-names" is optional */
 		if (!of_property_read_string_index(np, "interrupt-names", i,
 						   &name))
 			info->name = devm_kstrdup(dev, name, GFP_KERNEL);
+		else
+			info->name = devm_kstrdup(dev, "", GFP_KERNEL);
 
 		info->index = i;
 
-		list_add_tail(&info->list, irq_head);
+		list_add_tail(&info->list, &rproc_srm_dev->irq_list_head);
 		dev_dbg(dev, "Got irq %d (%s)\n", info->irq, info->name);
 	}
 
 	return 0;
 
 err:
-	rproc_srm_dev_put_irqs(rproc_srm_dev);
+	rproc_srm_dev_irqs_put(rproc_srm_dev);
 
 	return ret;
 }
 
 /* Clocks */
-static void rproc_srm_dev_deconfig_clocks(struct rproc_srm_dev *rproc_srm_dev)
+static void rproc_srm_dev_clocks_unsetup(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct rproc_srm_clk_info *c;
-	struct list_head *clk_head = &rproc_srm_dev->clk_list_head;
 
-	list_for_each_entry(c, clk_head, list) {
+	list_for_each_entry(c, &rproc_srm_dev->clk_list_head, list) {
 		if (!c->enabled)
 			continue;
 
 		clk_disable_unprepare(c->clk);
 		c->enabled = false;
-		dev_dbg(rproc_srm_dev->dev, "clk %d (%s) deconfigured\n",
+		dev_dbg(rproc_srm_dev->dev, "clk %d (%s) unsetup\n",
 			c->index, c->name);
 	}
 }
 
-static int rproc_srm_dev_config_clocks(struct rproc_srm_dev *rproc_srm_dev)
+static int rproc_srm_dev_clocks_setup(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct rproc_srm_clk_info *c;
-	struct list_head *clk_head = &rproc_srm_dev->clk_list_head;
 	int ret;
 
-	/* Note: not only configuring, but also enabling */
-
-	list_for_each_entry(c, clk_head, list) {
+	/* Prepare and enable clocks */
+	list_for_each_entry(c, &rproc_srm_dev->clk_list_head, list) {
 		if (c->enabled)
 			continue;
 
 		ret = clk_prepare_enable(c->clk);
 		if (ret) {
-			dev_err(rproc_srm_dev->dev, "clk %d (%s) cfg failed\n",
+			dev_err(rproc_srm_dev->dev,
+				"clk %d (%s) enable failed\n",
 				c->index, c->name);
-			rproc_srm_dev_deconfig_clocks(rproc_srm_dev);
+			rproc_srm_dev_clocks_unsetup(rproc_srm_dev);
 			return ret;
 		}
 		c->enabled = true;
-		dev_dbg(rproc_srm_dev->dev, "clk %d (%s) configured\n",
+		dev_dbg(rproc_srm_dev->dev, "clk %d (%s) enabled\n",
 			c->index, c->name);
 	}
 
 	return 0;
 }
 
-static void rproc_srm_dev_put_clocks(struct rproc_srm_dev *rproc_srm_dev)
+static struct rproc_srm_clk_info *rproc_srm_dev_clock_find(
+		struct rproc_srm_dev *rproc_srm_dev, struct clock_cfg *cfg)
+{
+	struct rproc_srm_clk_info *ci;
+
+	/* Search by index (if valid value) otherwise search by name */
+	list_for_each_entry(ci, &rproc_srm_dev->clk_list_head, list) {
+		if (cfg->index != U32_MAX) {
+			if (ci->index == cfg->index)
+				return ci;
+		} else {
+			if (!strcmp(ci->name, cfg->name))
+				return ci;
+		}
+	}
+
+	return NULL;
+}
+
+static int rproc_srm_dev_clock_set_cfg(struct rproc_srm_dev *rproc_srm_dev,
+				       struct clock_cfg *cfg)
+{
+	struct rproc_srm_clk_info *c;
+	struct device *dev = rproc_srm_dev->dev;
+	int ret;
+
+	c = rproc_srm_dev_clock_find(rproc_srm_dev, cfg);
+
+	if (!c) {
+		dev_err(dev, "unknown clock (id %d)\n", cfg->index);
+		return -EINVAL;
+	}
+
+	if (!c->enabled && cfg->enable) {
+		ret = clk_enable(c->clk);
+		if (ret) {
+			dev_err(dev, "clk enable failed\n");
+			return ret;
+		}
+		c->enabled = true;
+		dev_dbg(dev, "clk %d (%s) enabled\n", c->index, c->name);
+	} else if (c->enabled && !cfg->enable) {
+		clk_disable(c->clk);
+		c->enabled = false;
+		dev_dbg(dev, "clk %d (%s) disabled\n", c->index, c->name);
+	}
+
+	if (cfg->rate && clk_get_rate(c->clk) != cfg->rate) {
+		ret = clk_set_rate(c->clk, cfg->rate);
+		if (ret) {
+			dev_err(dev, "clk set rate failed\n");
+			return ret;
+		}
+
+		dev_dbg(dev, "clk %d (%s) rate = %d\n", c->index, c->name,
+			cfg->rate);
+	}
+
+	return 0;
+}
+
+static int rproc_srm_dev_clock_get_cfg(struct rproc_srm_dev *rproc_srm_dev,
+				       struct clock_cfg *cfg)
+{
+	struct rproc_srm_clk_info *c;
+
+	c = rproc_srm_dev_clock_find(rproc_srm_dev, cfg);
+	if (!c) {
+		dev_err(rproc_srm_dev->dev, "unknown clock (%d)\n", cfg->index);
+		return -EINVAL;
+	}
+
+	strlcpy(cfg->name, c->name, sizeof(cfg->name));
+	cfg->index = c->index;
+	cfg->enable = c->enabled;
+	cfg->rate = (u32)clk_get_rate(c->clk);
+
+	return 0;
+}
+
+static void rproc_srm_dev_clocks_put(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
 	struct rproc_srm_clk_info *c, *tmp;
-	struct list_head *clk_head = &rproc_srm_dev->clk_list_head;
 
-	list_for_each_entry_safe(c, tmp, clk_head, list) {
+	list_for_each_entry_safe(c, tmp, &rproc_srm_dev->clk_list_head, list) {
 		clk_put(c->clk);
 		dev_dbg(dev, "put clock %d (%s)\n", c->index, c->name);
 		list_del(&c->list);
 	}
 }
 
-static int rproc_srm_dev_get_clocks(struct rproc_srm_dev *rproc_srm_dev)
+static int rproc_srm_dev_clocks_get(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
 	struct device_node *np = dev->of_node;
 	struct rproc_srm_clk_info *c;
-	struct list_head *clk_head = &rproc_srm_dev->clk_list_head;
 	const char *name;
 	int nb_c, ret;
 	unsigned int i;
@@ -248,48 +315,53 @@ static int rproc_srm_dev_get_clocks(struct rproc_srm_dev *rproc_srm_dev)
 			goto err;
 		}
 
+		/* Note: "clock-names" is optional */
 		if (!of_property_read_string_index(np, "clock-names", i,
 						   &name))
 			c->name = devm_kstrdup(dev, name, GFP_KERNEL);
+		else
+			c->name = devm_kstrdup(dev, "", GFP_KERNEL);
 
 		c->index = i;
 
-		list_add_tail(&c->list, clk_head);
+		list_add_tail(&c->list, &rproc_srm_dev->clk_list_head);
 		dev_dbg(dev, "got clock %d (%s)\n", c->index, c->name);
 	}
 
 	return 0;
 
 err:
-	rproc_srm_dev_put_clocks(rproc_srm_dev);
+	rproc_srm_dev_clocks_put(rproc_srm_dev);
 	return ret;
 }
 
 /* Regulators */
-static void rproc_srm_dev_deconfig_regus(struct rproc_srm_dev *rproc_srm_dev)
+static void rproc_srm_dev_regus_unsetup(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct rproc_srm_regu_info *r;
-	struct list_head *regu_head = &rproc_srm_dev->regu_list_head;
+	struct device *dev = rproc_srm_dev->dev;
 
-	list_for_each_entry(r, regu_head, list) {
+	list_for_each_entry(r, &rproc_srm_dev->regu_list_head, list) {
 		if (!r->enabled)
 			continue;
 
-		regulator_disable(r->regu);
+		if (regulator_disable(r->regu)) {
+			dev_warn(dev, "regu %d disabled failed\n", r->index);
+			continue;
+		}
+
 		r->enabled = false;
-		dev_dbg(rproc_srm_dev->dev, "regu %d (%s) disabled\n",
-			r->index, r->name);
+		dev_dbg(dev, "regu %d (%s) disabled\n", r->index, r->name);
 	}
 }
 
-static int rproc_srm_dev_config_regus(struct rproc_srm_dev *rproc_srm_dev)
+static int rproc_srm_dev_regus_setup(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct rproc_srm_regu_info *r;
-	struct list_head *regu_head = &rproc_srm_dev->regu_list_head;
 	int ret;
 
 	/* Enable all the regulators */
-	list_for_each_entry(r, regu_head, list) {
+	list_for_each_entry(r, &rproc_srm_dev->regu_list_head, list) {
 		if (r->enabled)
 			continue;
 
@@ -297,7 +369,7 @@ static int rproc_srm_dev_config_regus(struct rproc_srm_dev *rproc_srm_dev)
 		if (ret) {
 			dev_err(rproc_srm_dev->dev, "regu %d (%s) failed\n",
 				r->index, r->name);
-			rproc_srm_dev_deconfig_regus(rproc_srm_dev);
+			rproc_srm_dev_regus_unsetup(rproc_srm_dev);
 			return ret;
 		}
 		r->enabled = true;
@@ -308,20 +380,113 @@ static int rproc_srm_dev_config_regus(struct rproc_srm_dev *rproc_srm_dev)
 	return 0;
 }
 
-static void rproc_srm_dev_put_regus(struct rproc_srm_dev *rproc_srm_dev)
+static struct rproc_srm_regu_info *rproc_srm_dev_regu_find(
+		struct rproc_srm_dev *rproc_srm_dev, struct regu_cfg *cfg)
+{
+	struct rproc_srm_regu_info *ri;
+
+	list_for_each_entry(ri, &rproc_srm_dev->regu_list_head, list) {
+		if (cfg->index != U32_MAX) {
+			if (ri->index == cfg->index)
+				return ri;
+		} else {
+			if (!strcmp(ri->name, cfg->name))
+				return ri;
+		}
+	}
+
+	return NULL;
+}
+
+static int rproc_srm_dev_regu_set_cfg(struct rproc_srm_dev *rproc_srm_dev,
+				      struct regu_cfg *cfg)
+{
+	struct rproc_srm_regu_info *r;
+	struct device *dev = rproc_srm_dev->dev;
+	int ret;
+
+	r = rproc_srm_dev_regu_find(rproc_srm_dev, cfg);
+	if (!r) {
+		dev_err(dev, "unknown regu (%d)\n", cfg->index);
+		return -EINVAL;
+	}
+
+	if (!r->enabled && cfg->enable) {
+		ret = regulator_enable(r->regu);
+		if (ret) {
+			dev_err(dev, "regu %d enable failed\n", r->index);
+			return ret;
+		}
+		r->enabled = true;
+		dev_dbg(dev, "regu %d (%s) enabled\n", r->index, r->name);
+	} else if (r->enabled && !cfg->enable) {
+		ret = regulator_disable(r->regu);
+		if (ret) {
+			dev_err(dev, "regu %d disable failed\n", r->index);
+			return ret;
+		}
+		r->enabled = false;
+		dev_dbg(dev, "regu %d (%s) disabled\n", r->index, r->name);
+	}
+
+	if (cfg->min_voltage_mv || cfg->max_voltage_mv) {
+		ret = regulator_set_voltage(r->regu, cfg->min_voltage_mv * 1000,
+					    cfg->max_voltage_mv * 1000);
+		if (ret) {
+			dev_err(dev, "regu %d set voltage failed\n", r->index);
+			return ret;
+		}
+
+		dev_dbg(dev, "regu %d (%s) voltage = [%d - %d] mv\n", r->index,
+			r->name, cfg->min_voltage_mv, cfg->max_voltage_mv);
+	}
+
+	return 0;
+}
+
+static int rproc_srm_dev_regu_get_cfg(struct rproc_srm_dev *rproc_srm_dev,
+				      struct regu_cfg *cfg)
+{
+	struct rproc_srm_regu_info *r;
+	struct device *dev = rproc_srm_dev->dev;
+	int v;
+
+	r = rproc_srm_dev_regu_find(rproc_srm_dev, cfg);
+	if (!r) {
+		dev_err(dev, "unknown regu (%d)\n", cfg->index);
+		return -EINVAL;
+	}
+
+	strlcpy(cfg->name, r->name, sizeof(cfg->name));
+	cfg->index = r->index;
+	cfg->enable = r->enabled;
+	cfg->min_voltage_mv = 0;
+	cfg->max_voltage_mv = 0;
+
+	v = regulator_get_voltage(r->regu);
+	if (v < 0) {
+		dev_warn(dev, "cannot get %s voltage\n", r->name);
+		cfg->curr_voltage_mv = 0;
+	} else {
+		cfg->curr_voltage_mv = v / 1000;
+	}
+
+	return 0;
+}
+
+static void rproc_srm_dev_regus_put(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
 	struct rproc_srm_regu_info *r, *tmp;
-	struct list_head *regu_head = &rproc_srm_dev->regu_list_head;
 
-	list_for_each_entry_safe(r, tmp, regu_head, list) {
+	list_for_each_entry_safe(r, tmp, &rproc_srm_dev->regu_list_head, list) {
 		devm_regulator_put(r->regu);
 		dev_dbg(dev, "put regu %d (%s)\n", r->index, r->name);
 		list_del(&r->list);
 	}
 }
 
-static int rproc_srm_dev_get_regus(struct rproc_srm_dev *rproc_srm_dev)
+static int rproc_srm_dev_regus_get(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
 	struct device_node *np = dev->of_node;
@@ -329,14 +494,13 @@ static int rproc_srm_dev_get_regus(struct rproc_srm_dev *rproc_srm_dev)
 	const char *n;
 	char *name;
 	struct rproc_srm_regu_info *r;
-	struct list_head *regu_head = &rproc_srm_dev->regu_list_head;
 	int ret, nb_s = 0;
 
 	if (!np)
 		return 0;
 
 	for_each_property_of_node(np, p) {
-		n = strstr(p->name, SUPPLY_SUFFIX);
+		n = strstr(p->name, "-supply");
 		if (!n || n == p->name)
 			continue;
 
@@ -347,7 +511,7 @@ static int rproc_srm_dev_get_regus(struct rproc_srm_dev *rproc_srm_dev)
 		}
 
 		name = devm_kstrdup(dev, p->name, GFP_KERNEL);
-		name[strlen(p->name) - strlen(SUPPLY_SUFFIX)] = '\0';
+		name[strlen(p->name) - strlen("-supply")] = '\0';
 		r->name = name;
 
 		r->regu = devm_regulator_get(dev, r->name);
@@ -359,25 +523,83 @@ static int rproc_srm_dev_get_regus(struct rproc_srm_dev *rproc_srm_dev)
 
 		r->index = nb_s++;
 
-		list_add_tail(&r->list, regu_head);
+		list_add_tail(&r->list, &rproc_srm_dev->regu_list_head);
 		dev_dbg(dev, "got regu %d (%s)\n", r->index, r->name);
 	}
 
 	return 0;
 
 err_list:
-	rproc_srm_dev_put_regus(rproc_srm_dev);
+	rproc_srm_dev_regus_put(rproc_srm_dev);
 	return ret;
 }
 
 /* Pins */
-static void rproc_srm_dev_put_pins(struct rproc_srm_dev *rproc_srm_dev)
+static int rproc_srm_dev_pin_set_cfg(struct rproc_srm_dev *rproc_srm_dev,
+				     struct pin_cfg *cfg)
+{
+	struct rproc_srm_pin_info *pi, *p = NULL;
+	struct device *dev = rproc_srm_dev->dev;
+	struct pinctrl_state *state;
+	int ret;
+
+	list_for_each_entry(pi, &rproc_srm_dev->pin_list_head, list) {
+		if (!strcmp(pi->name, cfg->name)) {
+			p = pi;
+			break;
+		}
+	}
+
+	if (!p) {
+		dev_err(dev, "unknown pin config (%s)\n", cfg->name);
+		return -EINVAL;
+	}
+
+	state = pinctrl_lookup_state(rproc_srm_dev->pctrl, cfg->name);
+	if (IS_ERR(state)) {
+		dev_err(dev, "cannot get pin config (%s)\n", cfg->name);
+		return -EINVAL;
+	}
+
+	ret = pinctrl_select_state(rproc_srm_dev->pctrl, state);
+	if (ret < 0) {
+		dev_err(dev, "cannot set pin config (%s)\n", cfg->name);
+		return ret;
+	}
+
+	list_for_each_entry(pi, &rproc_srm_dev->pin_list_head, list) {
+		pi->selected = (pi == p);
+	}
+
+	dev_dbg(dev, "pin config (%s) selected\n", p->name);
+
+	return 0;
+}
+
+static int rproc_srm_dev_pin_get_cfg(struct rproc_srm_dev *rproc_srm_dev,
+				     struct pin_cfg *cfg)
+{
+	struct rproc_srm_pin_info *p;
+
+	list_for_each_entry(p, &rproc_srm_dev->pin_list_head, list) {
+		if (p->selected) {
+			strlcpy(cfg->name, p->name, sizeof(cfg->name));
+			return 0;
+		}
+	}
+
+	dev_warn(rproc_srm_dev->dev, "cannot find selected pin state\n");
+	strcpy(cfg->name, "");
+
+	return 0;
+}
+
+static void rproc_srm_dev_pins_put(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
 	struct rproc_srm_pin_info *p, *tmp;
-	struct list_head *pin_head = &rproc_srm_dev->pin_list_head;
 
-	list_for_each_entry_safe(p, tmp, pin_head, list) {
+	list_for_each_entry_safe(p, tmp, &rproc_srm_dev->pin_list_head, list) {
 		devm_kfree(dev, p->name);
 		devm_kfree(dev, p);
 		dev_dbg(dev, "remove pin cfg %d (%s)\n", p->index, p->name);
@@ -390,12 +612,11 @@ static void rproc_srm_dev_put_pins(struct rproc_srm_dev *rproc_srm_dev)
 	}
 }
 
-static int rproc_srm_dev_get_pins(struct rproc_srm_dev *rproc_srm_dev)
+static int rproc_srm_dev_pins_get(struct rproc_srm_dev *rproc_srm_dev)
 {
 	struct device *dev = rproc_srm_dev->dev;
 	struct device_node *np = dev->of_node;
 	struct rproc_srm_pin_info *p;
-	struct list_head *pin_head = &rproc_srm_dev->pin_list_head;
 	int ret, nb_p;
 	unsigned int i;
 	const char *name;
@@ -403,8 +624,6 @@ static int rproc_srm_dev_get_pins(struct rproc_srm_dev *rproc_srm_dev)
 	if (!np)
 		return 0;
 
-	/* Assumption here is that "default" pinctrl applied before probe */
-
 	rproc_srm_dev->pctrl = devm_pinctrl_get(dev);
 	if (IS_ERR(rproc_srm_dev->pctrl))
 		return 0;
@@ -430,20 +649,107 @@ static int rproc_srm_dev_get_pins(struct rproc_srm_dev *rproc_srm_dev)
 			goto err;
 		}
 		p->name = devm_kstrdup(dev, name, GFP_KERNEL);
+		if (!strcmp(p->name, PINCTRL_STATE_DEFAULT))
+			p->selected = true;
 
 		p->index = i;
 
-		list_add_tail(&p->list, pin_head);
+		list_add_tail(&p->list, &rproc_srm_dev->pin_list_head);
 		dev_dbg(dev, "found pin cfg %d (%s)\n", p->index, p->name);
 	}
 	return 0;
 
 err:
-	rproc_srm_dev_put_pins(rproc_srm_dev);
+	rproc_srm_dev_pins_put(rproc_srm_dev);
 	return ret;
 }
 
 /* Core */
+static int rproc_srm_dev_notify_cb(struct notifier_block *nb, unsigned long evt,
+				   void *data)
+{
+	struct rproc_srm_dev *rproc_srm_dev =
+			container_of(nb, struct rproc_srm_dev, nb);
+	struct device *dev = rproc_srm_dev->dev;
+	struct rpmsg_srm_msg_desc *desc;
+	struct rpmsg_srm_msg *i, o;
+	int ret = 0;
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	desc = (struct rpmsg_srm_msg_desc *)data;
+	i = desc->msg;
+	o = *i;
+
+	/* Check if 'device_id' (name / addr ) matches this device */
+	if (!strstr(dev_name(dev), i->device_id))
+		return NOTIFY_DONE;
+
+	switch (i->message_type) {
+	case RPROC_SRM_MSG_SETCONFIG:
+		switch (i->rsc_type) {
+		case RPROC_SRM_RSC_CLOCK:
+			ret = rproc_srm_dev_clock_set_cfg(rproc_srm_dev,
+							  &i->clock_cfg);
+			if (!ret)
+				ret = rproc_srm_dev_clock_get_cfg(rproc_srm_dev,
+								  &o.clock_cfg);
+			break;
+		case RPROC_SRM_RSC_PIN:
+			ret = rproc_srm_dev_pin_set_cfg(rproc_srm_dev,
+							&i->pin_cfg);
+			if (!ret)
+				ret = rproc_srm_dev_pin_get_cfg(rproc_srm_dev,
+								&o.pin_cfg);
+			break;
+		case RPROC_SRM_RSC_REGU:
+			ret = rproc_srm_dev_regu_set_cfg(rproc_srm_dev,
+							 &i->regu_cfg);
+			if (!ret)
+				ret = rproc_srm_dev_regu_get_cfg(rproc_srm_dev,
+								 &o.regu_cfg);
+			break;
+		default:
+			dev_warn(dev, "bad rsc type (%d)\n", i->rsc_type);
+			ret = -EINVAL;
+			break;
+		}
+		break;
+	case RPROC_SRM_MSG_GETCONFIG:
+		switch (i->rsc_type) {
+		case RPROC_SRM_RSC_CLOCK:
+			ret = rproc_srm_dev_clock_get_cfg(rproc_srm_dev,
+							  &o.clock_cfg);
+			break;
+		case RPROC_SRM_RSC_PIN:
+			ret = rproc_srm_dev_pin_get_cfg(rproc_srm_dev,
+							&o.pin_cfg);
+			break;
+		case RPROC_SRM_RSC_REGU:
+			ret = rproc_srm_dev_regu_get_cfg(rproc_srm_dev,
+							 &o.regu_cfg);
+			break;
+		default:
+			dev_warn(dev, "bad rsc type (%d)\n", i->rsc_type);
+			ret = -EINVAL;
+			break;
+		}
+		break;
+	default:
+		dev_warn(dev, "bad msg type (%d)\n", i->message_type);
+		ret = -EINVAL;
+		break;
+	}
+
+	/* Send return msg */
+	if (ret)
+		o.message_type = RPROC_SRM_MSG_ERROR;
+
+	ret = rpmsg_srm_send(desc->ept, &o);
+
+	return ret ? NOTIFY_BAD : NOTIFY_STOP;
+}
+
 static void
 rproc_srm_dev_unbind(struct device *dev, struct device *master, void *data)
 {
@@ -451,10 +757,10 @@ rproc_srm_dev_unbind(struct device *dev, struct device *master, void *data)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	rproc_srm_dev_deconfig_regus(rproc_srm_dev);
-	rproc_srm_dev_deconfig_clocks(rproc_srm_dev);
+	rproc_srm_dev_regus_unsetup(rproc_srm_dev);
+	rproc_srm_dev_clocks_unsetup(rproc_srm_dev);
 
-	/* For pins and IRQs: nothing to deconfigure */
+	/* For pins and IRQs: nothing to unsetup */
 }
 
 static int
@@ -465,15 +771,15 @@ rproc_srm_dev_bind(struct device *dev, struct device *master, void *data)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	ret = rproc_srm_dev_config_clocks(rproc_srm_dev);
+	ret = rproc_srm_dev_clocks_setup(rproc_srm_dev);
 	if (ret)
 		return ret;
 
-	ret = rproc_srm_dev_config_regus(rproc_srm_dev);
+	ret = rproc_srm_dev_regus_setup(rproc_srm_dev);
 	if (ret)
 		return ret;
 
-	/* For pins and IRQs: nothing to configure */
+	/* For pins and IRQs: nothing to setup */
 	return 0;
 }
 
@@ -496,37 +802,48 @@ static int rproc_srm_dev_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rproc_srm_dev->dev = dev;
+	rproc_srm_dev->core = dev_get_drvdata(dev->parent);
+
 	INIT_LIST_HEAD(&rproc_srm_dev->clk_list_head);
 	INIT_LIST_HEAD(&rproc_srm_dev->pin_list_head);
 	INIT_LIST_HEAD(&rproc_srm_dev->regu_list_head);
 	INIT_LIST_HEAD(&rproc_srm_dev->irq_list_head);
 
 	/* Get clocks, regu, irqs and pinctrl */
-	ret = rproc_srm_dev_get_clocks(rproc_srm_dev);
+	ret = rproc_srm_dev_clocks_get(rproc_srm_dev);
 	if (ret)
 		return ret;
 
-	ret = rproc_srm_dev_get_regus(rproc_srm_dev);
+	ret = rproc_srm_dev_regus_get(rproc_srm_dev);
 	if (ret)
-		goto err;
+		goto err_get;
 
-	ret = rproc_srm_dev_get_pins(rproc_srm_dev);
+	ret = rproc_srm_dev_pins_get(rproc_srm_dev);
 	if (ret)
-		goto err;
+		goto err_get;
 
-	ret = rproc_srm_dev_get_irqs(rproc_srm_dev);
+	ret = rproc_srm_dev_irqs_get(rproc_srm_dev);
 	if (ret)
-		goto err;
+		goto err_get;
+
+	rproc_srm_dev->nb.notifier_call = rproc_srm_dev_notify_cb;
+	ret = rproc_srm_core_register_notifier(rproc_srm_dev->core,
+					       &rproc_srm_dev->nb);
+	if (ret)
+		goto err_register;
 
 	dev_set_drvdata(dev, rproc_srm_dev);
 
-	return  component_add(dev, &rproc_srm_dev_ops);
+	return component_add(dev, &rproc_srm_dev_ops);
 
-err:
-	rproc_srm_dev_put_irqs(rproc_srm_dev);
-	rproc_srm_dev_put_pins(rproc_srm_dev);
-	rproc_srm_dev_put_regus(rproc_srm_dev);
-	rproc_srm_dev_put_clocks(rproc_srm_dev);
+err_register:
+	rproc_srm_core_unregister_notifier(rproc_srm_dev->core,
+					   &rproc_srm_dev->nb);
+err_get:
+	rproc_srm_dev_irqs_put(rproc_srm_dev);
+	rproc_srm_dev_pins_put(rproc_srm_dev);
+	rproc_srm_dev_regus_put(rproc_srm_dev);
+	rproc_srm_dev_clocks_put(rproc_srm_dev);
 	return ret;
 }
 
@@ -539,10 +856,13 @@ static int rproc_srm_dev_remove(struct platform_device *pdev)
 
 	component_del(dev, &rproc_srm_dev_ops);
 
-	rproc_srm_dev_put_irqs(rproc_srm_dev);
-	rproc_srm_dev_put_regus(rproc_srm_dev);
-	rproc_srm_dev_put_pins(rproc_srm_dev);
-	rproc_srm_dev_put_clocks(rproc_srm_dev);
+	rproc_srm_core_unregister_notifier(rproc_srm_dev->core,
+					   &rproc_srm_dev->nb);
+
+	rproc_srm_dev_irqs_put(rproc_srm_dev);
+	rproc_srm_dev_regus_put(rproc_srm_dev);
+	rproc_srm_dev_pins_put(rproc_srm_dev);
+	rproc_srm_dev_clocks_put(rproc_srm_dev);
 
 	return 0;
 }
-- 
2.7.4
