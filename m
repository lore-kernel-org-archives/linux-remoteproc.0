Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1A1E515;
	Fri, 12 Jun 2026 21:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301006; cv=none; b=uJh+fIKpC3mxNA+mzGjlqeeLzCNpkJoGwjKiduI6OwlKhSn+z8EShedKtT+w2Uqdyv1NT1FzrTgj1TcRLaNgVHLiN+Q0cqHKr/SVoDG843eWsb/ooV/buFx10XJQWSqv6WUFqKojFBr1z6vRxgax6SqZTyyr7dlxCl+ySu+QeAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301006; c=relaxed/simple;
	bh=HoP0t3X4806LumAvHUqdONnNt9e+c41S+yDwblHJXFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hb1HmwONlj2uY7GyLfWkRMnnpKq1TD3Z8ERfg3/DKbulL/MJz5gTOrGE2tQoPxJCA/pRddc1dJieatwbJMEXex+e5QYodXJPketmIFB7H3FH/d0iWLQSzmhJB8SretKIAiR0RZbIbTW03p1LS5C1Z6KSr+TLh7kclZ+RFT88+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkPwfOsz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkPwfOsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B1C1F000E9;
	Fri, 12 Jun 2026 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301005;
	bh=+KhLm1PdeFoofGdrL+J9J3T/pIpV9iZEAIAU52x8EsY=;
	h=From:To:Cc:Subject:Date;
	b=SkPwfOszRT1YpT1dul4bA7bJzSH5yaIg4CyTxVz/fpJyrnqPuEOx68GTtbwUQS5R+
	 ViMUNTliwOUioLtWyYUYj0yIdAUY1FSs948RaVF5JW7fWJWV/cfRp7tUdYt4g92mdr
	 cLbYsW0baK9yUkTQUwSdE97jrKPkahBAvUcXk2Wh4TW6iVwEamgST4+CM5JgAirCMu
	 zR1TYBn9itf1T49fWLBCUdP79LrV84rKUsB/ucpE9l+nL1ccer4QhWW+lqCDs4xWZN
	 PI/tQIi85UaXB+QrRSkQISyqj8WWcaoexlQxtxWthqWglPuydFeSw/JSkTnXSsbCM0
	 piKiO6rTAOy/Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: Use presence checks for syscon props
Date: Fri, 12 Jun 2026 16:49:58 -0500
Message-ID: <20260612214959.1884404-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OMAP and Keystone remoteproc drivers only need to know whether
"ti,bootreg" and "ti,syscon-dev" are present before parsing them.
Reading those properties as booleans misrepresents their DT encoding.

Use of_property_present() for the presence tests and keep the existing
phandle parsing for the actual property values.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/remoteproc/keystone_remoteproc.c | 2 +-
 drivers/remoteproc/omap_remoteproc.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index e7fde5509786..83763d640c4e 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -317,7 +317,7 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 
-	if (!of_property_read_bool(np, "ti,syscon-dev")) {
+	if (!of_property_present(np, "ti,syscon-dev")) {
 		dev_err(dev, "ti,syscon-dev property is absent\n");
 		return -EINVAL;
 	}
diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index cb01354248af..6ed0f28edac9 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1140,7 +1140,7 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
 	if (!data)
 		return -ENODEV;
 
-	if (!of_property_read_bool(np, "ti,bootreg"))
+	if (!of_property_present(np, "ti,bootreg"))
 		return 0;
 
 	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
-- 
2.53.0

