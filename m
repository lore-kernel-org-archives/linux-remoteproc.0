Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024446;
	b=cHafQ7RjGArD6rhFqfh0b310B4RX8Khlw+lQKpPjYZ8ak5vumULMe4lJ9J1qE1Fpz+oE
	 XG3VgAdknRmzSApA7Z0n8TPM4V7gbV6wBEEbJgkOTofI2yCZN+fkWY0qqoA8uj4mIFLrB
	 voCZ6mjO8dj7os0hBMoRShWAdnhD+rhVPFCMvyXu7s5LkDHqurxb5ZGlkd4ccHGueaVBo
	 3xaNEEPFXKGBnx2tE+k+jd36WMRrW6mw4BkDOVtkUc1LPeGQ6hjTN+y7654nuda3Q117M
	 2/C4PGfIgS1NjbgjANYQ6A/IwXXTi7lR4Z6ZnFmYhTmKG6lCoYQhXPjgeG6O/DfEGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
	b=b1Xc0irel4GtnTQ3vkg2vu9ZNuHM38wH3/j05nBNyrD711zD17MTEsdvlcq60mmMK7Lk
	 wyzRJpsjp5Djetgd7GbMif1TviNUDz3IFp75KTFaiyLxZQoLnCDpeDUdkkz7vJpPyZ4ro
	 v0s/+8/xBKw18mv58eUwlcsXy7OwJEluLD9jighGIvm2j9D3F7xHrZFgSWylYSuPXZY/p
	 1epKMXypebXqInlq/j5cZ4PLvdlbkRsox9XqfmFbFxxJ2SYsRw0yPRELKYr1xphrAuDLl
	 kTslRgvrPdgTi4q5HijdoN+LQdCoTkXTOPw/Zblg8iCd4cGHbzyiFqXH6x3MzQBa1dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPmfWjhF;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DAE606A331
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 17:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DAE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPmfWjhF
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bb5afa736so92327eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024445; x=1795629245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
        b=nPmfWjhFSXKVsOedyCpWGxiT0bmkvZTBxQAIoH3WOGQ+Tkpav5ZboHgU8H7zmbfgK2
         oI+BGSsLQDxb4KMhZDuvQGVWTISfprhkwTCgbs9EqjqELWCn+GYEkHK8B4jpo0seRq/7
         Lo52EaLrsc1kkTbyXs15jn9zbI+x6kVfNxsZuG3E18VGqPSN3kN7EzRUAU7UGVN8NmGW
         8z1Tq6YnQo6vsY+PRUdTswyX6WEonDwPD7kF6ibHYWMoHY9VHxTOuFcQ6jxfZ9+0Sien
         +D6AX0Ts7YOfA0zFuRP2DXyP3tDrCkyn0a9SRuUEYSG/W5pITNRbv7FBcNp43LyQiYRC
         6CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024445; x=1795629245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqweH0pYyIm/pZwPzk7IcmA/lXOB2dIrOde0Tai0CcU=;
        b=DWefVI9OzzxxZSOaXlQGjZD15OyiaNKo7EYOZgkk5MU1122idPNSb/ADw09rphd/f7
         d4y24Ie7iCQB8/ZnyhrgLLjbjVWEkvKzHCfG5th1WpkmueWQt+CiAYBCQjndNh6IwbFP
         ZFlvI0um9ApdrdNV/F3ibCwMtwq6eD2Dk7lawrPZqaSY/k9iZVk19yROYgOxaCzqOE92
         2JF+zxZsTLdAeWBO3XtjmdRLooUQtpDIeQ56pnV+/zRSWTLevTxKqhIupqekTbAXNeNI
         76CupF7MFiz00A///MXQ1GUfjZoN3CwKbSk4jbLvq37peYTyISIUAgno6apHEw4ygR4k
         uJrA==
X-Forwarded-Encrypted: i=1; AL+hErEObfAzf+LN7kPTKzkkZxS7Oqp0y6tINQ7xtBHhg8U56yu0xwWvLN70BcnAVxd1MCVPZh+dWrxEL+Z5pq5ndUAz@vger.kernel.org
X-Gm-Message-State: APuU4Z/iEF99Ka3CLMg3PKPbJ+av9loVfWwmyzgFu4F2SdJomF5HSUd6
	CglRbPfF8lYJhSUvU0cBURljz3iSwwdeVREnPYe4OAvvmtm7ZIbUXLTQ
X-Gm-Gg: AZFdTZf2vbG/C/TV+/hg5LVwpDJ9uouLCm76V3/pEPik2lcQ/rIwm1R4CVE0NzO5UAR
	DpVNL7vjPQmXMYvCE/YMZtYKs0riRDBLh0C04CIZWX06fsHxS7M0HKUBoZwS7UhzNAa3gQ2JRJX
	6vG1mANfDZIaMQSEa59WuYnde39FRhbB82Lw28aYTG1VCsS6SfkH1/qJ8lkDDXYeEVI7asWrX+S
	/CeUkIUDVGl8/23vqjbF1W4nOQUXGGhtulQhqataSOkCaBoUFSwQD5+OTIuuq6rG9CY3XHk1jgf
	aOuHT9uJ2PYxE5QDLd57yzklgQOpRySmYiuYzYYzNb8tbjDchN8gG5lSzUqLrXzDFTv4kl6usaq
	RasqJ7zJjyrQHJ4n22tYpY1EUzaI+vWBc5Hhs7kNyBI1pnsRkYl3EvjmK705IwcQIFXCTeYyXzY
	ojfOS2EM3PpJmdafEw+ukcU8un0eil6PZ7OOlDTrbblAqBHQ03XxU3OW9XITvbz+zAKvkp6pXWl
	/r+uVVTNAGFe7/qLmMgwrtzQHHefmjcP9bBXlRcBVTB7kGnG7tZSDz0v8VQC9P6mGhAeYkAuPJE
	VAt9/XQBBmEDZ0AIvBTYii3bAgsLAkDCvGtZbaWhieO0Z5Ag/+OqmQ==
X-Received: by 2002:a05:7300:c595:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3827f98fedbmr5064472eec.1.1795024444661;
        Wed, 18 Nov 2026 09:54:04 -0800 (PST)
Received: from localhost.localdomain ([38.254.175.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm10352900eec.24.2026.11.18.09.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:54:04 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: quic_akdwived@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] remoteproc: qcom_q6v5_mss: Fix off-by-one error in regulator error cleanup
Date: Wed, 18 Nov 2026 23:23:54 +0530
Message-Id: <20261118175354.42351-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

In q6v5_regulator_enable(), when any operation fails for regulator at
index 'i', the error cleanup path unconditionally calls
regulator_disable() starting from index 'i'. However, regulator 'i'
was never successfully enabled at this point, resulting in an
unbalanced disable.

There are three distinct failure points:
- regulator_set_voltage() failure: voltage was never set, load was
never set, regulator was never enabled.
- regulator_set_load() failure: voltage was set, but regulator was
never enabled.
- regulator_enable() failure: voltage and load were set, but
regulator was never enabled.

Fix this by introducing three separate error labels to handle each
failure point correctly. For the failing regulator at index 'i',
only reset the resources that were actually configured, without
calling regulator_disable(). Then roll back all previously enabled
regulators using 'i--' in the for loop initializer to skip the
never-enabled regulator.

Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and active regulators.")
Cc: stable@vger.kernel.org
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Resend, rebased on next-20261117, no code changes. Reviewed by Dmitry
on Aug 18. Original posting:
https://lore.kernel.org/r/20260710194638.1502-1-saileshnandanavanam@gmail.com
 drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index dd052a62b858..692cbdece318 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -313,7 +313,7 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 				dev_err(qproc->dev,
 					"Failed to request voltage for %d.\n",
 						i);
-				goto err;
+				goto err_set_voltage;
 			}
 		}
 
@@ -323,20 +323,26 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 			if (ret < 0) {
 				dev_err(qproc->dev,
 					"Failed to set regulator mode\n");
-				goto err;
+				goto err_set_load;
 			}
 		}
 
 		ret = regulator_enable(regs[i].reg);
 		if (ret) {
 			dev_err(qproc->dev, "Regulator enable failed\n");
-			goto err;
+			goto err_enable;
 		}
 	}
 
 	return 0;
-err:
-	for (; i >= 0; i--) {
+err_enable:
+	if (regs[i].uA > 0)
+		regulator_set_load(regs[i].reg, 0);
+err_set_load:
+	if (regs[i].uV > 0)
+		regulator_set_voltage(regs[i].reg, 0, INT_MAX);
+err_set_voltage:
+	for (i--; i >= 0; i--) {
 		if (regs[i].uV > 0)
 			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
 
-- 
2.34.1

