Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D875B1D0947;
	Wed, 23 Oct 2024 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700522; cv=none; b=aLmkaExLOyU+yXUHhCv1kcguKNytouOnO2nSbcS0rpuk+SLogfB/HpoitUo8kcda5Fk2YXUc/NNdVUUYRgLPhBGWyBAcXWGL0tyKHT5gzMQcv4dwdjzLqX/MBfVLUgx/BYbNAiwz3Vx6Oqi0tuEhwh3vq4rbxUE5TNMl+Wd/7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700522; c=relaxed/simple;
	bh=q2rbwlaTGi31j0XT7revT6yVeLSydbtOS/oqjvuC68I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C7Q3Z07wCOTWhOUxA3DrHTMOOeWaKaFSzvGLxgyv0QV+gW0ylcitHqoJO+bEYaikb9kWYyIfAzoHp26PfgBduGQIqzZSYFtWL7fMg7A6vgC5eA/C5naGue6WKqa59/tTIQ2zKwyTOnbbeRxwBBhMKyx1/Cz8otjKtfcGxXXcTWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSVHLU++; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSVHLU++"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so8799016a12.0;
        Wed, 23 Oct 2024 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700518; x=1730305318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=One71U5tHDn0Fw0x5xIglBa+y9G8Ir7vW4xGkDlikec=;
        b=GSVHLU++6iZOrzkhUgi2T/T9Lba9guwLt9bSNZfCECc6TAmhKs/glF2lSHUHM/Rol8
         CrjUAL3ImwxGf8bfW/sd3v5fUIRk6xo5WmLi/MV0LfNWo9ra10lq1yC9lhjqYGYC2PQO
         /OfohNrB980El1bIS5wT0qA/BKSS9f0+2BydeEcAVmRdj8mKDtUvt/Oym+5Qq4r7wwrb
         HqqFL3vSKOC2sEP0h4ETbziCRx8XB18pVzqCqEvWTrrNInmsxINFgoK2HKXP/g54JrBO
         cZLy1qVc8jSXCpiFTr9TzyBqtx45TTfdM0survgwGTF79iSS5OTsjBQvMMsd2inQcAXy
         kPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700518; x=1730305318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=One71U5tHDn0Fw0x5xIglBa+y9G8Ir7vW4xGkDlikec=;
        b=sttrSCqDmOtewmLjSCQ4mIW7Gr0Kmm1X2Ng5bo6jAqpizjn7qyQoeE0n1xNfnBZVeP
         GxQb/yPeJzZ8/4Dsp0ZRYb2M5gIN0yfyV4k4L6yT4qqtLH+VV944ugDLIyJvyp2Tugd+
         V051Qr6UYAmpqAeOU+NAYCZDp/xWfQiaIeBu/G06cXBUM+1BTFNZTYmAkjuuCUKMxmwH
         BWScPQeP2J1MuL1bvweNWBcptugCGEaIZnACSK97j2MIDOqo/VVv/gmo6vMJZTkYLHT2
         qrdDX8/jjyjeDqL6A+zLAhqH0xPUU7U8el+0etioVn7XZCOEU8mundqDP5CTWqxac2oY
         8CYw==
X-Forwarded-Encrypted: i=1; AJvYcCVj7scGPsw9wvgv61uaH3NM555K0EK0R5fMrh/AJ8dcd1twDWgsEgOvkKmsiakUsaYvH8qHqDuu+8S6UAnj@vger.kernel.org, AJvYcCWkLOTzDqlWgAFFsYKm+tLu1jb85XQhS9+nLr1wsFQ7h6+g73uCDUZvqE0mGRh5t2jG82yb2EcIeGCIn+Q=@vger.kernel.org, AJvYcCWqanEk7h+El/aisbEHVbA886s/S+IOmO4QuNLm4Wz0vR6TClTaUHfjcsv/DVE5E2kQ1rLSjdhCX6EL@vger.kernel.org
X-Gm-Message-State: AOJu0YzFqL6wWJTg0svCA+caBiiLV1s+CDjODgW1yTT1V+BsZsDQjZTx
	HF47XNPkEDYBkMnwtQMIodoUu5lTb5YhGjv/81VvD+oOuNFy/OlQ
X-Google-Smtp-Source: AGHT+IFHCIbcnEqthuiotWM3IhUwJGO5vNmq5ANb1TEU7fxVmhEQejK0iqQE+TAOgYiUqP2tsdRD2Q==
X-Received: by 2002:a05:6402:4311:b0:5c9:547d:99 with SMTP id 4fb4d7f45d1cf-5cb8ac49231mr2888617a12.2.1729700517759;
        Wed, 23 Oct 2024 09:21:57 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:57 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: SOF: imx: add driver for imx95
Date: Wed, 23 Oct 2024 12:21:13 -0400
Message-Id: <20241023162114.3354-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add SOF driver for imx95.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/Kconfig  |   8 +
 sound/soc/sof/imx/Makefile |   2 +
 sound/soc/sof/imx/imx95.c  | 383 +++++++++++++++++++++++++++++++++++++
 3 files changed, 393 insertions(+)
 create mode 100644 sound/soc/sof/imx/imx95.c

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 4751b04d5e6f..51a70a193533 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -50,4 +50,12 @@ config SND_SOC_SOF_IMX8ULP
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_SOF_IMX95
+	tristate "SOF support for i.MX95"
+	depends on IMX_DSP
+	help
+	  This adds support for Sound Open Firmware for NXP i.MX95 platforms.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 endif ## SND_SOC_SOF_IMX_TOPLEVEL
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index be0bf0736dfa..715ac3798668 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -2,10 +2,12 @@
 snd-sof-imx8-y := imx8.o
 snd-sof-imx8m-y := imx8m.o
 snd-sof-imx8ulp-y := imx8ulp.o
+snd-sof-imx95-y := imx95.o
 
 snd-sof-imx-common-y := imx-common.o
 
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
 obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
 obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
+obj-$(CONFIG_SND_SOC_SOF_IMX95) += snd-sof-imx95.o
 obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
diff --git a/sound/soc/sof/imx/imx95.c b/sound/soc/sof/imx/imx95.c
new file mode 100644
index 000000000000..3f7ed6a16c42
--- /dev/null
+++ b/sound/soc/sof/imx/imx95.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <sound/sof.h>
+#include <linux/arm-smccc.h>
+#include <linux/firmware/imx/dsp.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/clk.h>
+
+#include "../sof-of-dev.h"
+#include "../ops.h"
+
+#define IMX_SIP_SRC 0xC2000005
+#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
+
+#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
+
+#define IMX_SIP_LMM 0xC200000F
+#define IMX_SIP_LMM_BOOT 0x0
+#define IMX_SIP_LMM_SHUTDOWN 0x1
+
+#define IMX95_M7_LM_ID 0x1
+
+#define MBOX_DSPBOX_OFFSET 0x1000
+
+struct imx95_priv {
+	struct platform_device *ipc_dev;
+	struct imx_dsp_ipc *ipc_handle;
+	resource_size_t bootaddr;
+};
+
+static void imx95_ipc_handle_reply(struct imx_dsp_ipc *ipc)
+{
+	unsigned long flags;
+	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
+
+	spin_lock_irqsave(&sdev->ipc_lock, flags);
+	snd_sof_ipc_process_reply(sdev, 0);
+	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
+}
+
+static void imx95_ipc_handle_request(struct imx_dsp_ipc *ipc)
+{
+	snd_sof_ipc_msgs_rx(imx_dsp_get_data(ipc));
+}
+
+static struct imx_dsp_ops ipc_ops = {
+	.handle_reply = imx95_ipc_handle_reply,
+	.handle_request = imx95_ipc_handle_request,
+};
+
+static int imx95_disable_enable_core(bool enable)
+{
+	struct arm_smccc_res res;
+
+	if (enable)
+		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT, IMX95_M7_LM_ID,
+			      0, 0, 0, 0, 0, &res);
+	else
+		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN, IMX95_M7_LM_ID,
+			      0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx95_run(struct snd_sof_dev *sdev)
+{
+	return imx95_disable_enable_core(true);
+}
+
+static int imx95_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	struct imx95_priv *priv = sdev->pdata->hw_pdata;
+
+	sof_mailbox_write(sdev, sdev->host_box.offset,
+			  msg->msg_data, msg->msg_size);
+
+	imx_dsp_ring_doorbell(priv->ipc_handle, 0);
+
+	return 0;
+}
+
+static int imx95_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_DSPBOX_OFFSET;
+}
+
+static int imx95_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	switch (type) {
+	case SOF_FW_BLK_TYPE_SRAM:
+	case SOF_FW_BLK_TYPE_DRAM:
+		return type;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int imx95_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	/* no offset for window regions - they are already relative
+	 * to the mailbox memory region described in DT.
+	 */
+	return 0;
+}
+
+static int imx95_set_power_state(struct snd_sof_dev *sdev,
+				 const struct sof_dsp_power_state *target_state)
+{
+	sdev->dsp_power_state = *target_state;
+
+	return 0;
+}
+
+/* no other resources to power on during (runtime) resume so these functions
+ * don't do any resource management (i.e: clks, PDs, etc...). As for enabling
+ * the M7 LM: this is taken care of by run(), which is called during sof_resume().
+ */
+static int imx95_runtime_resume(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	return snd_sof_dsp_set_power_state(sdev, &target_state);
+}
+
+static int imx95_resume(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	if (pm_runtime_suspended(sdev->dev)) {
+		pm_runtime_disable(sdev->dev);
+		pm_runtime_set_active(sdev->dev);
+		pm_runtime_mark_last_busy(sdev->dev);
+		pm_runtime_enable(sdev->dev);
+		pm_runtime_idle(sdev->dev);
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_state);
+}
+
+static int imx95_runtime_suspend(struct snd_sof_dev *sdev)
+{
+	int ret;
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D3,
+	};
+
+	ret = imx95_disable_enable_core(false);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to disable core: %d\n", ret);
+		return ret;
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_state);
+}
+
+static int imx95_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
+{
+	int ret;
+	const struct sof_dsp_power_state target_power_state = {
+		.state = target_state,
+	};
+
+	if (!pm_runtime_suspended(sdev->dev)) {
+		ret = imx95_disable_enable_core(false);
+		if (ret < 0) {
+			dev_err(sdev->dev, "failed to suspend: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
+}
+
+static struct snd_soc_dai_driver imx95_dai[] = {
+	{
+		.name = "sai3",
+		.playback = {
+			.channels_min = 1,
+			.channels_max = 32,
+		},
+		.capture = {
+			.channels_min = 1,
+			.channels_max = 32,
+		},
+	},
+};
+
+static int imx95_probe(struct snd_sof_dev *sdev)
+{
+	struct platform_device *pdev;
+	struct imx95_priv *priv;
+	struct resource *res;
+	struct arm_smccc_res smc_ret;
+	int ret;
+
+	pdev = container_of(sdev->dev, struct platform_device, dev);
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "failed to alloc priv\n");
+
+	sdev->pdata->hw_pdata = priv;
+
+	/* map DRAM */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dram");
+	if (!res)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "failed to fetch DRAM region\n");
+
+	sdev->bar[SOF_FW_BLK_TYPE_DRAM] = devm_ioremap(&pdev->dev, res->start,
+						       resource_size(res));
+	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_DRAM]))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_DRAM]),
+				     "failed to map DRAM region\n");
+
+	sdev->mmio_bar = SOF_FW_BLK_TYPE_DRAM;
+	priv->bootaddr = res->start;
+
+	/* map mailbox region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mailbox");
+	if (!res)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "failed to fetch MAILBOX region\n");
+
+	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(&pdev->dev, res->start,
+							  resource_size(res));
+	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]),
+				     "failed to map mailbox region\n");
+
+	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
+	sdev->dsp_box.offset = MBOX_DSPBOX_OFFSET;
+
+	ret = of_reserved_mem_device_init(sdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to bind DMA region\n");
+
+	priv->ipc_dev = platform_device_register_data(&pdev->dev, "imx-dsp",
+						      PLATFORM_DEVID_NONE,
+						      pdev, sizeof(*pdev));
+	if (IS_ERR(priv->ipc_dev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->ipc_dev),
+				     "failed to create IPC device\n");
+
+	priv->ipc_handle = dev_get_drvdata(&priv->ipc_dev->dev);
+	if (!priv->ipc_handle) {
+		ret = -EPROBE_DEFER;
+		dev_err(&pdev->dev, "failed to fetch ipc handle\n");
+		goto err_unregister_ipc_dev;
+	}
+
+	priv->ipc_handle->ops = &ipc_ops;
+	imx_dsp_set_data(priv->ipc_handle, sdev);
+
+	/* set core boot reset address */
+	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, priv->bootaddr,
+		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_ret);
+	if ((int)smc_ret.a0 < 0) {
+		ret = smc_ret.a0;
+		dev_err(&pdev->dev, "failed to set boot address: %d", ret);
+		goto err_unregister_ipc_dev;
+	}
+
+	return 0;
+
+err_unregister_ipc_dev:
+	platform_device_unregister(priv->ipc_dev);
+
+	return ret;
+}
+
+static void imx95_remove(struct snd_sof_dev *sdev)
+{
+	struct imx95_priv *priv;
+
+	priv = sdev->pdata->hw_pdata;
+
+	if (imx95_disable_enable_core(false))
+		dev_err(sdev->dev, "failed to stop core\n");
+
+	platform_device_unregister(priv->ipc_dev);
+}
+
+static const struct snd_sof_dsp_ops sof_imx95_ops = {
+	.probe = imx95_probe,
+	.remove = imx95_remove,
+
+	/* mandatory "DSP" ops */
+	.run = imx95_run,
+	.block_read = sof_block_read,
+	.block_write = sof_block_write,
+	.send_msg = imx95_send_msg,
+	.load_firmware = snd_sof_load_firmware_memcpy,
+	.ipc_msg_data = sof_ipc_msg_data,
+
+	.mailbox_read = sof_mailbox_read,
+	.mailbox_write = sof_mailbox_write,
+
+	.get_mailbox_offset = imx95_get_mailbox_offset,
+	.get_bar_index = imx95_get_bar_index,
+	.get_window_offset = imx95_get_window_offset,
+
+	.pcm_open = sof_stream_pcm_open,
+	.pcm_close = sof_stream_pcm_close,
+	.set_stream_data_offset = sof_set_stream_data_offset,
+
+	.runtime_suspend = imx95_runtime_suspend,
+	.runtime_resume = imx95_runtime_resume,
+
+	.resume = imx95_resume,
+	.suspend = imx95_suspend,
+
+	.set_power_state = imx95_set_power_state,
+
+	.drv = imx95_dai,
+	.num_drv = ARRAY_SIZE(imx95_dai),
+
+	.hw_info = SNDRV_PCM_INFO_MMAP |
+		   SNDRV_PCM_INFO_MMAP_VALID |
+		   SNDRV_PCM_INFO_INTERLEAVED |
+		   SNDRV_PCM_INFO_PAUSE |
+		   SNDRV_PCM_INFO_BATCH |
+		   SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+};
+
+static struct snd_sof_of_mach sof_imx95_machs[] = {
+	{
+		.compatible = "fsl,imx95-19x19-evk",
+		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
+	{
+	},
+};
+
+static struct sof_dev_desc sof_of_imx95_desc = {
+	.of_machines = sof_imx95_machs,
+	.ipc_supported_mask = BIT(SOF_IPC_TYPE_3),
+	.ipc_default = SOF_IPC_TYPE_3,
+	.default_fw_path = {
+		[SOF_IPC_TYPE_3] = "imx/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC_TYPE_3] = "sof-imx95.ri",
+	},
+	.ops = &sof_imx95_ops,
+};
+
+static const struct of_device_id sof_of_imx95_ids[] = {
+	{ .compatible = "fsl,imx95-cm7-sof", .data = &sof_of_imx95_desc },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sof_of_imx95_ids);
+
+static struct platform_driver snd_sof_of_imx95_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+		.name = "sof-audio-of-imx95",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_imx95_ids,
+	},
+};
+module_platform_driver(snd_sof_of_imx95_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for i.MX95 platforms");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.34.1

