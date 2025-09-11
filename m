Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89966322A3B;
	Thu, 11 Sep 2025 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757599253; cv=none; b=Ih8AljBqU9LtF/fE8B6Lasjjn2ncZ3XgvZDGQKOVUvW6VDkeTRrcbFwgelpFw3xyBfQtJe2D5TEzXNNr9ZmWeCaTBLpNMJLuHagmw/vhVe9eP2P3VNw1HWjVVnEnebytJTjTEg0pJPvRfV0MSzMX78h6D47I+N0BGcbxWSqoALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757599253; c=relaxed/simple;
	bh=YZgir26I9tEMrliPJqpACHa6ZwxQisNAKsIviQDd448=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BoNM6NyREfi1WrLFez8l4et9QZ0jjqvXMRmCdLLPaCxPoNPjAeOd4d9c2fChfzWvLo668M81cd/l5wyABAuYXFfcYeBJ5kDSDZg9+1w2ADRBQ8sIMYmBP2nU0kncZgtmd1dBfdg0BuwsbTASBDP6YQWnRWtli4SQ7Nq+ZbA061k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ptIWOqlj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ptIWOqlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757599249;
	bh=YZgir26I9tEMrliPJqpACHa6ZwxQisNAKsIviQDd448=;
	h=From:To:Cc:Subject:Date:From;
	b=ptIWOqljayKuQNx+9DWJiytF129iv9cMbyC6IdhX4Gi4Gkgv0nIqG0gNaawlWJw0g
	 9jTWQoOPjbQTMbBHbde7s+3+jfA6uy4sViuuWRKdG9/TBuq3G8L64p5/inX/5i5rUN
	 js2/xRXCUUlse7g6FaWx1jsxyOnDTgfavwGyNRBiKn8cXknyIlYpeml5jhbtZhm/F8
	 UhJE+6O4hI8NGp9dqT4xmDHraZtYPgG1TVpE/36HMz2EHAJLGKLKyRdqHRN7omTIlQ
	 5/WsEAuSTwweO9T7kkfiT+GZJYIhZP7GAWvVsRE3mBYI7JRQuUrcSmDMMxcBcA9x78
	 jw9FpY0sy1o2Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 406D417E00EC;
	Thu, 11 Sep 2025 16:00:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-remoteproc@vger.kernel.org
Cc: arnd@arndb.de,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] remoteproc: mtk_scp: Construct FW path if firmware-name not present
Date: Thu, 11 Sep 2025 16:00:43 +0200
Message-ID: <20250911140043.190801-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a reply on the mailing lists [1] it emerged that the DT
property "firmware-name" should not be relied on because of
possible issues with firmware versions.
For MediaTek SCP, there has never been any firmware version vs
driver version desync issue but, regardless, the firmwares are
always using the same name and they're always located in a path
with a specific pattern.

Instead of unconditionally always relying on the firmware-name
devicetree property to get a path to the SCP FW file, drivers
should construct a name based on what firmware it knows and
what hardware it is running on.

In order to do that, add a `scp_get_default_fw_path()` function
that constructs the path and filename based on two of the infos
that the driver can get:
 1. The compatible string with the highest priority (so, the
    first one at index 0); and
 2. The type of SCP HW - single-core or multi-core.

This means that the default firmware path is generated as:
 - Single core SCP: mediatek/(soc_model)/scp.img
   for example:     mediatek/mt8183/scp.img;

 - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
   for example:     mediatek/mt8188/scp_c0.img for Core 0, and
                    mediatek/mt8188/scp_c1.img for Core 1.

Note that the generated firmware path is being used only if the
"firmware-name" devicetree property is not present in the SCP
node or in the SCP Core node(s).

[1 - Reply regarding firmware-name property]
Link: https://lore.kernel.org/all/7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com/
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 64 ++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8206a1766481..80fcb4b053b3 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -16,6 +16,7 @@
 #include <linux/remoteproc.h>
 #include <linux/remoteproc/mtk_scp.h>
 #include <linux/rpmsg/mtk_rpmsg.h>
+#include <linux/string.h>
 
 #include "mtk_common.h"
 #include "remoteproc_internal.h"
@@ -1093,22 +1094,73 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
+/**
+ * scp_get_default_fw_path() - Get default SCP firmware path
+ * @dev:     SCP Device
+ * @core_id: SCP Core number
+ *
+ * This function generates a path based on the following format:
+ *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
+ *     mediatek/(soc_model)/scp.img for single core SCP HW
+ *
+ * Return: A devm allocated string containing the full path to
+ *         a SCP firmware or an error pointer
+ */
+static const char *scp_get_default_fw_path(struct device *dev, int core_id)
+{
+	struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
+	char scp_fw_file[7] = "scp_cX";
+	const char *compatible, *soc;
+	int ret;
+
+	/* Use only the first compatible string */
+	ret = of_property_read_string_index(np, "compatible", 0, &compatible);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* If the compatible string's length is implausible bail out early */
+	if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))
+		return ERR_PTR(-EINVAL);
+
+	/* If the compatible string starts with "mediatek,mt" assume that it's ok */
+	if (!str_has_prefix(compatible, "mediatek,mt"))
+		return ERR_PTR(-EINVAL);
+
+	if (core_id >= 0)
+		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+	else
+		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
+	if (ret <= 0)
+		return ERR_PTR(ret);
+
+	soc = &compatible[strlen("mediatek,")];
+
+	return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
+			      (int)strlen("mtXXXX"), soc, scp_fw_file);
+}
+
 static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 				      struct mtk_scp_of_cluster *scp_cluster,
-				      const struct mtk_scp_of_data *of_data)
+				      const struct mtk_scp_of_data *of_data,
+				      int core_id)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct mtk_scp *scp;
 	struct rproc *rproc;
 	struct resource *res;
-	const char *fw_name = "scp.img";
+	const char *fw_name;
 	int ret, i;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
-	if (ret < 0 && ret != -EINVAL)
-		return ERR_PTR(ret);
+	if (ret) {
+		fw_name = scp_get_default_fw_path(dev, core_id);
+		if (IS_ERR(fw_name)) {
+			dev_err(dev, "Cannot get firmware path: %ld\n", PTR_ERR(fw_name));
+			return ERR_CAST(fw_name);
+		}
+	}
 
 	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
 	if (!rproc) {
@@ -1212,7 +1264,7 @@ static int scp_add_single_core(struct platform_device *pdev,
 	struct mtk_scp *scp;
 	int ret;
 
-	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
+	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev), -1);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
@@ -1259,7 +1311,7 @@ static int scp_add_multi_core(struct platform_device *pdev,
 			goto init_fail;
 		}
 
-		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
+		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id], core_id);
 		put_device(&cpdev->dev);
 		if (IS_ERR(scp)) {
 			ret = PTR_ERR(scp);
-- 
2.51.0

