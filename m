Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107789;
	b=Va5bPHLEHkxSZa/qMh1T8FuzGBUmq0UKMssNeVlsrqfnEp6/jRVDOOq2dCLtAfyn4+1p
	 pRQKTQPISxce0b1tmi4Th/kKMRhW8Bj+OyYQykgCd0nu8rMC2rox6Mq605s5PqZDF4Z3x
	 TcLbnpZemqjJRwYUMYD+lq367Zz2IoxrF1iyKJEhfbf59j4Sp3+YR4STnY18sWw8jC0XM
	 QW8cApV6l+2z0rqKH82dL2FYM/XaWr51CQ3R7DZygXsB8vY2AqB6RLVDrydd/R0+71RGj
	 kL2X1AKQIZRT5X3RdOk4XNYLaPWCr1tfMRje4SmaHo9ZUVyRZrqA26c4FjjNSX71CgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107789;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=+S/FPM+nKVm2hgvH1mGORYvabxW96gUvOBqdZ925Miw=;
	b=AZo4ktNjSCxBHajJU6tGaNaWaAotDw4a8yLQZVKXhl/76Y7NkQGdX58LXN7F17kMVI5n
	 eAXcMyV1J0A8wwJhbgjEouP2Ns2r7Y0/Go6NnGDpXGlCzcpJ/T8QksMf/6B08s4GgAotP
	 L40MRhpIXUNmXAhpmiCMA8y9pu9jdTqibareVD0j+YKbuxgg8R8/bV10N42Hpw30ht8ow
	 CIp6EvtkAu/V3Wwzc7VOXQlXO0Zlmokf6aX4m0XNgN5BTBi60amXeR6Nc68WxuKgRVRi1
	 v9N6kxP6fBm9SuDK6r8sXlyrDg95/Fjrdq2GqhBSHkUWhe+cGFCJ+pY17sq70Bq3FNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EdEw0nXE;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7B660A2611;
	Tue, 27 Oct 2026 13:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7B660A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EdEw0nXE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=+S/FPM+nKV
	m2hgvH1mGORYvabxW96gUvOBqdZ925Miw=; b=EdEw0nXEebnHQKlYWOGA143YXF
	spbNwqPQ0iFNPXZYfMFXFCoQQkiwMy7ik+Pyx5sg03zOKds9/MZEOhKPdTK3k2Lk
	8lSBJ/XhMf+um4Z9VUpmaIKwIwchpaXr43/xN+WRgCMNR6CdsEj9Srz8NUSnZaZA
	yG8HSGlPG30ZA8wsE=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCXHkNIp+BqfmxRAA--.995S2;
	Tue, 27 Oct 2026 21:29:45 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_q6v5_pas: release the DTB firmware after loading it
Date: Tue, 27 Oct 2026 21:29:44 +0800
Message-ID: <20261027132944.242550-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCXHkNIp+BqfmxRAA--.995S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KryDKF47Ww1fJFy8Gr47twb_yoW8Zw4fpF
	4kAFWqkF4UGw4rGrZxJr4xur98uwsYq3y3Kr40kasayF4xZrykZrZ5JF4vqrs5CrWDtw13
	Wa1xKr93JF1qg3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU86c_3UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rfqlZqOAAvsu

qcom_pas_load() requests the DTB firmware into pas->dtb_firmware and
only releases it when qcom_mdt_pas_load() fails.  On the success path
nothing drops the reference and the pointer stays set, so every boot of
a remote processor that has a dtb image leaks the firmware buffer, and
a second boot overwrites the stale pointer and leaks it again.

qcom_pas_start() only needs pas->dtb_pas_ctx (it maps the spare carveout
and authenticates through the PAS context), so the firmware buffer can
be released as soon as it has been loaded.  Scope it to qcom_pas_load()
and drop the struct member.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c2..5a5dc5334 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -94,7 +94,6 @@ struct qcom_pas {
 	const char *info_name;
 
 	const struct firmware *firmware;
-	const struct firmware *dtb_firmware;
 
 	phys_addr_t mem_phys;
 	phys_addr_t dtb_mem_phys;
@@ -242,18 +241,20 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
 	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+		const struct firmware *dtb_firmware;
+
+		ret = request_firmware(&dtb_firmware, pas->dtb_firmware_name, pas->dev);
 		if (ret) {
 			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
 				pas->dtb_firmware_name, ret);
 			return ret;
 		}
 
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, dtb_firmware,
 					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		release_firmware(dtb_firmware);
 		if (ret) {
 			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
 			return ret;
 		}
 	}
-- 
2.53.0

