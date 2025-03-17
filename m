Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED078237702;
	Mon, 17 Mar 2025 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213217; cv=none; b=Zjm6aWEl0BkQEgsw3uK9CyMSTls645wv8SR1Ye6Adox70Wg2Abk9iico0KCwBAYsAyaV5mckSA70MvRBI/a4W2Vew2gym/OuOLhOAYeCIHyBEM0x725K8cQvwIODDtNIIvdUL+2y4RGf2aRCiOSHOFErEThUbMVy4rPwFOtY0yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213217; c=relaxed/simple;
	bh=fHvN3SeufGoM2fTYZPedWl6rS124Ik77Iqo8gEyIIoE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FTGZ26kXIeIYhNeNWLlWUn3PR65tfp5IQO7pJS3OzhW2auyAsU/3k6TDtfGr+uzAqAXDpfk6W9vqicRYDnIFFycQwwuIBmhYPVh79jnherjI46h+gJthQBOy7XHN2QCRZmZDJi8zgPv2Vha40onZvIi7f0LEDETojRfXOsBOhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Hy9kBjB3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Hy9kBjB3"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC6lCU2331252
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 07:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213207;
	bh=ctTUdnR2MdrpDLtA+XdCyp46a6uSDi77ljjnnnnR8jw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Hy9kBjB3XrFZ/xMBuAwui9IGd5zhgd4CLMHAmRv10ZNP4iDPCTDBp5rUKhtRgN2yF
	 QoZAG8+gIyAb6Bqi/idhdaMV8g1Bq11XfcajFJkV1WelByTMO6d7pKpCXiW9xLEG1L
	 +9ZrHh2M0LTkimqTNWx01G7MOamBxJi31SgKFN50=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6lJs004930;
	Mon, 17 Mar 2025 07:06:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:06:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:06:46 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MK1060901;
	Mon, 17 Mar 2025 07:06:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 04/26] remoteproc: k3-{m4/dsp}: Align internal rproc data structure with R5
Date: Mon, 17 Mar 2025 17:36:00 +0530
Message-ID: <20250317120622.1746415-5-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317120622.1746415-1-b-padhi@ti.com>
References: <20250317120622.1746415-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Introduce a void pointer in the k3_{m4/dsp}_rproc internal data
structure which can be used to point to any private data needed by the
driver. Currently, the M4/DSP drivers do not have any private data, so
the pointer can be left pointing to NULL. Additionally, add a pointer to
the rproc struct within k3_m4_rproc internal struct. This is done to
align the data structures with R5 driver which can be factored out at a
later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 ++
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a695890254ff..31e43e49f1e4 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @priv: Remote processor private data
  */
 struct k3_dsp_rproc {
 	struct device *dev;
@@ -91,6 +92,7 @@ struct k3_dsp_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	void *priv;
 };
 
 /**
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a16fb165fced..d0ee7a8d460d 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -50,6 +50,7 @@ struct k3_m4_rproc_mem_data {
 /**
  * struct k3_m4_rproc - k3 remote processor driver structure
  * @dev: cached device pointer
+ * @rproc: remoteproc device handle
  * @mem: internal memory regions data
  * @num_mems: number of internal memory regions
  * @rmem: reserved memory regions data
@@ -60,9 +61,11 @@ struct k3_m4_rproc_mem_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @priv: Remote processor private data
  */
 struct k3_m4_rproc {
 	struct device *dev;
+	struct rproc *rproc;
 	struct k3_m4_rproc_mem *mem;
 	int num_mems;
 	struct k3_m4_rproc_mem *rmem;
@@ -73,6 +76,7 @@ struct k3_m4_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	void *priv;
 };
 
 /**
@@ -578,6 +582,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	rproc->recovery_disabled = true;
 	kproc = rproc->priv;
 	kproc->dev = dev;
+	kproc->rproc = rproc;
 	platform_set_drvdata(pdev, rproc);
 
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
-- 
2.34.1

