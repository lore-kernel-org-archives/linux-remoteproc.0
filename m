Received: from msa.smtpout.orange.fr (smtp-82.smtpout.orange.fr [80.12.242.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CF537F5;
	Sat,  7 Sep 2024 06:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725690850; cv=none; b=i1fEdnPyJYkv/1D5nLytlTvZOyz89dcToUGUcCKTFRwN3MgfFBKx27l0FlqG9oClnYXPGrN61PPFH5b6bklHGCC64Fynx05lcIeovu+bU6TTRvuiQhFI/oTwC9Oozf+h2xaegyaFABRL6I2ojwbbxHHWw6qeZszdlHLp6xUSjYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725690850; c=relaxed/simple;
	bh=wKKUhuk4/8nuwN3KHkOpj5C9UBcs9XwomYBbixsGmT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahCPmtyJjp98KYweKjuKSIOtD8Tg4e3ONyded88cmxkStieYKniAwd0mOfjfBhFWEwq2yqUw6d67QNSKlSUN0EeMjajjItm39zn6BEAJSOWPwIh2QXN//MJgAwdh/GYWqXCj4AdoNlsmwcd8H5q8TzsRpIM2Bl23G/2nxOL8EXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Zsg18Ynj; arc=none smtp.client-ip=80.12.242.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Zsg18Ynj"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mp15s8krT41DAmp15s0m7E; Sat, 07 Sep 2024 08:34:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725690844;
	bh=vatYoRMNlrx3CKxeuEKiLmkf8Cu3ogQPLSh6KML7njU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Zsg18YnjvI6bf0nAJC8erjWdsFkxjkuMmvbrXF0DvAu1mjFjcAUMVAH45WxWYjqiw
	 cEATo6CIJhYkvQtCu3RKpW0ql2esQN5zxdGreUdY/agznIK1M/oo0LeFF7osaYkYC/
	 /uQ6AdO8QJ1qR8+79rnQxcfXQoPQu71lV8hNVGpydWZTJW2tm2TVG/HwswOtViM1CG
	 58DSkcqCzErp4UKHKWPF9xXswWxOdvcfRQLTusfZUFp1am7bFP2viC7gbGuX9UFZCu
	 303rPaMmOfaejsbm+KjUsg5zs9blIoTiaxLHPITzb88dy8lBZXfSkk4xAcLUF1/G1Q
	 097EQrU1samcg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Sep 2024 08:34:04 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Beleswar Padhi <b-padhi@ti.com>,
	Andrew Davis <afd@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2] remoteproc: k3-dsp: Fix an error handling path in k3_dsp_rproc_probe()
Date: Sat,  7 Sep 2024 08:33:36 +0200
Message-ID: <9485e427a9041cc76cfd3dbcc34874af495e160a.1725653543.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after the k3_dsp_rproc_request_mbox() call,
mbox_free_channel() must be called, as already done in the remove function.

Instead of adding an error handling path in the probe and changing all
error handling in the function, add a new devm_add_action_or_reset() and
simplify the .remove() function.

Fixes: ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during probe routine")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Andrew Davis <afd@ti.com>
---
Compile tested only

Change in v2:
  - fix the subject (cut'n'paste issue)   [Andrew Davis]
  - add R-b tag
  
v1: https://lore.kernel.org/all/9485e127a00419c76cf13dbccf4874af395ef6ba.1725653543.git.christophe.jaillet@wanadoo.fr/
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 8be3f631c192..f29780de37a5 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -610,6 +610,13 @@ static void k3_dsp_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
+static void k3_dsp_free_channel(void *data)
+{
+	struct k3_dsp_rproc *kproc = data;
+
+	mbox_free_channel(kproc->mbox);
+}
+
 static int k3_dsp_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -649,6 +656,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, k3_dsp_free_channel, rproc);
+	if (ret)
+		return ret;
+
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
 	if (IS_ERR(kproc->ti_sci))
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
@@ -741,8 +752,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
 		if (ret)
 			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
 	}
-
-	mbox_free_channel(kproc->mbox);
 }
 
 static const struct k3_dsp_mem_data c66_mems[] = {
-- 
2.46.0

