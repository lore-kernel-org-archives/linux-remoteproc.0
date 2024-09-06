Received: from msa.smtpout.orange.fr (out-71.smtpout.orange.fr [193.252.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2821B85DA;
	Fri,  6 Sep 2024 20:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725654109; cv=none; b=k3zslRhm4MJKA5u/s+Wel+b6nd8JVmkiIOnHUnmzsjjxhb8gIQgX8XIZiQz8MedqudV4prvmT6EL9XQZMb3r4Y8KCNmffbXrIPNz6k+0+oVPKxpHknAB+ag65FrFHdXkfZYKEhau5UzIY8pRgXTdyxIPe0dpFg0a9gvopzdFDsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725654109; c=relaxed/simple;
	bh=uC0ydIMdg0ZCO0gSWKl7+jBSAf+ViD9hpKkjnf6nImY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OmHy0UUle3twUBruyHxmo1uCKotD8IIk/SevTfVfKMPOGdNsklBSJ0m+t34wXevvAK7wSZgnBAoetE4Ro0wGWaq6dCGxF67h5r85fr+/yh96m6lKy62/cBDqwGcocyFrt8y9IZSYo5PFAepLMToz9DVnqScMAzf9hW6Um35LVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=A1MGBYcr; arc=none smtp.client-ip=193.252.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="A1MGBYcr"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mfJxsDep9rSO8mfJxsbsNN; Fri, 06 Sep 2024 22:12:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725653563;
	bh=n4hPyoyvbAXaAbLake+2SOrhOz+bTth/ETkGDgZ9rEA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=A1MGBYcr1k8zA8EJkd4bnZpyPA51yt6GW/VgUIyA2P9R1tcXViFWYB+3mfZuDtuY2
	 6Qho8tDCd+o+EHSDiwFf8zL+mfEWd87Z52lJJkWP0vFyza1XzDMgrN4foL0PX7Qn1X
	 t43zhB1pC1KCgJfrCh+9kMHK58HROXBtAY4uGAjwlt+dLYynXr/1LmsX3ykLFiCYSH
	 SZpYoDIlgdpejdfYKghpVQi7kQ8qt49kHIb0pagvc6XByUu+HI3tRW7w88NIVTiUrq
	 1lVygnVj3Icg6XaIHhM1YdCvobM2jNiCYHtWviPEn93t6nwxrX+Sq7v1eOSTX8cUre
	 IuIdoU6iHIv7A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Sep 2024 22:12:43 +0200
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
Subject: [PATCH] remoteproc: k3-dsp: Fix an error handling path in max77686_rtc_probe()
Date: Fri,  6 Sep 2024 22:12:38 +0200
Message-ID: <9485e127a00419c76cf13dbccf4874af395ef6ba.1725653543.git.christophe.jaillet@wanadoo.fr>
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
---
Compile tested only
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

