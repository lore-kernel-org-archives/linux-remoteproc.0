Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E71A83B9;
	Fri,  2 Aug 2024 18:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622997; cv=none; b=SGKog8dPE3Vzumue29IGE4bvPH8UDJGt10X1tig2d/pt58UYHrrwt9Y2eo56k17+Mou/tawFIFBMpAZOKfOjjbWn/Yfvggj7WLKRKLY7t1FF1+hAsCDC8e5U0ZDWFoGJQ/pZHV7MAJ6OlnTKj4WRxt05TpHU8y+hbm17AH/kCTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622997; c=relaxed/simple;
	bh=M+ulUkV1YTG068x/Qdy7o5UyxYtRh+kStIOmvFqJrHI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JX5sEWuay+E63lSSj438WC6eHYqFDTc0cJGwwSV84ZHfOoqwsbxvP+6dYMmdPnvtFiLU/2grDiiVxHJi1K2PDaUY+Ld7LaRqjbgGmK2zKexZ1Z0FYrXfNytm5uslhk7QqKHcSDzN4H4XWPwr+PzCvJ9mmRjo2fWq9blXQrzi64Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Nw1VcDDK; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Nw1VcDDK"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472IN1xH069877;
	Fri, 2 Aug 2024 13:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722622981;
	bh=QM5oBnyYC3TLRvQQiX0szRRaPNGIEa5CsBev4nNhHDs=;
	h=From:To:CC:Subject:Date;
	b=Nw1VcDDK2TsE97UWRYIkAZESGrQ/1PZy+RYVY1uciNeCwRfDqtB9H2KK/4VBOhO5R
	 FbCAp3QZIuSRtOvh6HLpaqhjn0IVTY1zlfhddCbTV7JISq8+IcTNRgmrcm7WaLODO/
	 lYOHh2lhohrFQVgmz09tdBLTzggEE5gR8/OG6y8E=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472IN1kI044102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 13:23:01 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 13:23:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 13:23:01 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472IN0BQ039524;
	Fri, 2 Aug 2024 13:23:01 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/7] remoteproc: keystone: Use devm_kasprintf() to build name string
Date: Fri, 2 Aug 2024 13:22:54 -0500
Message-ID: <20240802182300.244055-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

This is simpler and removes the need to assume the id length to be 1
digit, which then removes a W=1 compile warning about the same.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 7e57b90bcaf85..81b179e269a1e 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -366,8 +366,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	int dsp_id;
 	char *fw_name = NULL;
-	char *template = "keystone-dsp%d-fw";
-	int name_len = 0;
 	int ret = 0;
 
 	if (!np) {
@@ -382,11 +380,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	}
 
 	/* construct a custom default fw name - subject to change in future */
-	name_len = strlen(template); /* assuming a single digit alias */
-	fw_name = devm_kzalloc(dev, name_len, GFP_KERNEL);
+	fw_name = devm_kasprintf(dev, GFP_KERNEL, "keystone-dsp%d-fw", dsp_id);
 	if (!fw_name)
 		return -ENOMEM;
-	snprintf(fw_name, name_len, template, dsp_id);
 
 	rproc = rproc_alloc(dev, dev_name(dev), &keystone_rproc_ops, fw_name,
 			    sizeof(*ksproc));
-- 
2.39.2

