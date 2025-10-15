Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0830505A;
	Wed, 15 Oct 2025 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760517674; cv=none; b=DPgOa3MoGFWwkgUMhFHFHJjDbniikql5U6xJfA5qWpR924d2I+5WJXvl1wf9ACyOZtMuUF5sEeL5YM3f9X1aTfOdU4zCFo93YxGyZVBBalsfLnUux27bjyGSlm+bd0+SGujqfYxPypLZWJ6NkKvN9RoEo07F5uSl2zLVds8to0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760517674; c=relaxed/simple;
	bh=kR6/KdiaTWKCxxOavj8of+mL1hKW3b416j+YBrUpGWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M4dNIP/EIUPpu+rSjzBiO/67nMSQ7kz7AdDwE+sW6MzW3MNLbZtfOpGWfzQuMw+w52weeonZFJcRn9duZzkTrWIHBlQuBWdR4/GsdKhWuFu5fBfhCqtWlLuLvKJ4PnAUlcuXdOnPFouEIkiwlkD0egqb5m20HBN3PbEoT2BtYAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N0eXyqja; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N0eXyqja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760517670;
	bh=kR6/KdiaTWKCxxOavj8of+mL1hKW3b416j+YBrUpGWQ=;
	h=From:To:Cc:Subject:Date:From;
	b=N0eXyqja0v+Co8k0lr4IboExscq9FB89iIKZhunISadTeac1usfo4/jbvjBab5UHu
	 3NBn+AhszjbXsgPB0muh9DT8fNOqFD+puaFwquqXCaBBioqwMISmNdEk6H42yED01i
	 ysQEC2Nop7S0AL7ffLHfSeYLFQ5eIbHxSX4OospjFqSxsVR+sHqYDWlBvTUdfMGOP0
	 4uKN99XIwOPyM7i/kHy/giq06Z4JPQafpL6PYgzO9+ZvgDIgNpUtT0cQ81RBxEhUZS
	 RNTUwLZ6YgVxDXU8BjTrghmxX+XHAX62GEbhvbNiJz5WO/oVAH5Dzq0QSSOMGzuPNw
	 X/5ZnqvJ+/Q6A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D77B617E055D;
	Wed, 15 Oct 2025 10:41:09 +0200 (CEST)
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
Subject: [PATCH v2] remoteproc: mtk_scp: Construct FW path if firmware-name not present
Date: Wed, 15 Oct 2025 10:41:03 +0200
Message-ID: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
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

Changes in v2:
 - Removed initialization of scp_fw_file[7] char array (or string if you prefer)

 drivers/remoteproc/mtk_scp.c | 65 ++++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8206a1766481..10e3f9eb8cd2 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -16,6 +16,7 @@
 #include <linux/remoteproc.h>
 #include <linux/remoteproc/mtk_scp.h>
 #include <linux/rpmsg/mtk_rpmsg.h>
+#include <linux/string.h>
 
 #include "mtk_common.h"
 #include "remoteproc_internal.h"
@@ -1093,22 +1094,74 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
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
+	const char *compatible, *soc;
+	char scp_fw_file[7];
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
+	/* Not using strchr here, as strlen of a const gets optimized by compiler */
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
@@ -1212,7 +1265,7 @@ static int scp_add_single_core(struct platform_device *pdev,
 	struct mtk_scp *scp;
 	int ret;
 
-	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
+	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev), -1);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
@@ -1259,7 +1312,7 @@ static int scp_add_multi_core(struct platform_device *pdev,
 			goto init_fail;
 		}
 
-		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
+		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id], core_id);
 		put_device(&cpdev->dev);
 		if (IS_ERR(scp)) {
 			ret = PTR_ERR(scp);
-- 
2.51.0

