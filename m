Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C0E30C37C
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784778774; cv=none; b=jD4Gu+/w5oj0Pm0p/hXModK+F/rdPRAxTGwskKu6853ZGu4TW0pFosWNqRBEQFb1oyGX+jJBvAp+ROb9WGOXaBzOZLp1115+pio80WxdQhCl64EjdNKAzR5327t1H8mMPa4ExgxjiwIOl4f3D2XXeOUolD1YsenOdFOUO+tOHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784778774; c=relaxed/simple;
	bh=irfiZOifeyWOUCtM47KfCZDnE9mtbMMGQ5BGkiJSl0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loOj3GCg6RWgkDuaE+09xnDo/dGkcpRHxStX21BBndFdHYZTr8EyuznQ19ek5Nhqfx7LJ+e4XQqHadkeqhdMsLDJbH9v0OdqoRqIFSFwEo7j7cK/Nze1Qe3RqWOvY/zkufm9mYgBNcoTLqnMPFISqbg7bb8UNRZ4ovCzedC/8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddedFOPt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcAXLTdg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddedFOPt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcAXLTdg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XKOn2478939
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZYXvJvVw8IEDkhOWbvRCtr0X0gY/RcbUzb6a0neVOo=; b=ddedFOPtcrI4+WjI
	HA8wZmVVrgA+yvPAPrKT3sX4jWNNHBaWE6qr76vt8ATLnYsj7qF49jgdZIo6aLek
	FxgI6za86OmMjcJfu1raN082ttDD2/6Z8CANB1ZqvG4Xacjnv4zeYJs2Z9UT3LPI
	CXS1cUcxuoRII/V826XHG+fTd8ASl33fWHcwdodPr4KUiqWCIO8hPUmF2Ba+C4o3
	8zpl2AUy3fdj//y7VkW1sXdE3wHYhfiWyuq8gAHN20ITCCts2cj9Ip89qU1x1uzz
	5Dd/kMsh3ftCkS6QCqzkde+SPJgk+m+0i/3WgMqUhvyboS2rHi4/XNlT3Kli0K7n
	l+ys/w==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7bxx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:51 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44aeefa1a30so292573fac.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784778771; x=1785383571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZYXvJvVw8IEDkhOWbvRCtr0X0gY/RcbUzb6a0neVOo=;
        b=XcAXLTdgQYeeTi/g+RDC3xqu1U4/ReR/IWn4vE9vHbXbGCjjWl4kmYWGBJt6gmDS/6
         nDgOIZJ+AVoEDF3HXdTcas3V28rBjD1Eh4n0nooCKL+dtIzflQPhDeY55VxNm+L5EK/o
         n/l56KoiXh3sXq/bxt5kSX/++zFID3QywcrjqPFOIYipOCd3nAn9ctYhivh13LZQpIGr
         +PHIR7kJWDfFbizsHYEIRx2ofsU8Jj3Sx7rFjwrsSJMa8Da/66mk4fka4/XXtPoWtuX7
         br/BSqSN1PbAOz2xP5TVsM+Ujq0gDXYorX7i9XR3LN85rSfp7cSuqeBVvZpFts5u+sYU
         XW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784778771; x=1785383571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZYXvJvVw8IEDkhOWbvRCtr0X0gY/RcbUzb6a0neVOo=;
        b=M0Cd/osJvVt95tVybyM5Yhhi+BjC4T/DohzMzQrMYMTWhc795SB3NpylqqzFis8qlt
         n6QA7+/bf4dxHsbGSq4cVNcIw52rtpnPQZlHsnhyNR0pDXyD3ssMcegLJlHXqRdtOGE+
         y+2/oXR+QWmmhnTHyfHos03dnxpOC/d6dpK5GZsZrQ0ccbfOFgKGJVYBp4EMw61QnCPM
         BbzT9XD6EfYMYTtgWa3tZNE+zuJY/ZnKP/2lVa/FDwubdhhpLu75gqMpsvJOphotzAEe
         RxQGlipZKy5AWzOiMTRAnr0xCpw3KK4n3StYshePMLx/PfSHQ5l/AP1J58Pewi16/YIE
         xnww==
X-Forwarded-Encrypted: i=1; AHgh+RpG8/Xa4uWzxCv311wsuCKlbAev1dWAV3hcOOAcEgKF2VBDSawh9bvXeJsVTMlbMroZ95bsiN+Pd07jtFxT0anZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqeKqhz7pwOX+hyuRJQv7WJ8BvZhzCZuuO3tOAz27rUrukAVw
	DbKYU1NPsivpQWPh754JnQCehUmZEPXYUIOS6g08P+XQFZBJ/z+NiTXbB1RrGSsi3CLmIMV8jzJ
	ZHmr10kfQChWo67lQGkGILlesqde0sIp0L1pkxHbNzzXwhJ7sjq4Q6BogGIcIbKAKTT1TTJkd
X-Gm-Gg: AR+sD11xxt04tkVVUnwiAsGMoPAH6ZRUqpCY0hGCBXobbzxL4kA2uV19aMG3W4sA2w/
	AKlQiXdoAxcrqFg2I0akzKsQ6nLM2vVteT6da8DTWpwtYbr8wmGD4nL/PPyUai2Daj8Syir2qHA
	b0+VlTXWHOetz2w/F9ZsJCSGcnA3WT6aa0asb6ZCN/JggihfXRVatuU+Xgw2TFsRurRe8T25ml8
	eQ4QuF6W4te3W3DWsUabxbpyWJDCHj7uEtL5PjFsSdVcNo5LrFP+YjevP6wvTF26AI1rzu8G2MG
	3UrIaU2qrPzaM8S1q2eJkv/oA80tG+89eqU/IlJX+F43uEorkHWT37cMJH00c/AlMLKPA1UmjEL
	D5YupZXDOvW0FY8w6idY=
X-Received: by 2002:a05:6870:15cc:b0:456:b3d9:336d with SMTP id 586e51a60fabf-457a0fae90dmr706976fac.20.1784778771031;
        Wed, 22 Jul 2026 20:52:51 -0700 (PDT)
X-Received: by 2002:a05:6870:15cc:b0:456:b3d9:336d with SMTP id 586e51a60fabf-457a0fae90dmr706960fac.20.1784778770587;
        Wed, 22 Jul 2026 20:52:50 -0700 (PDT)
Received: from [172.17.0.2] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f238b0sm3302323fac.8.2026.07.22.20.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:52:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 03:52:29 +0000
Subject: [PATCH 3/3] remoteproc: Force shutdown during device removal
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=irfiZOifeyWOUCtM47KfCZDnE9mtbMMGQ5BGkiJSl0k=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqYZAL3utqaCRT7hZgpx8cjdZiIYGvBZDP2n5pf
 ANUun1yUgqJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamGQCw4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxWMmD/4uqG8e1QtrFyMoj5/qZfCAR+qUMwVseDGbC2//SgZfxBAT6lN
 Rh6lhckJrOayIQihg2JzH6hlLSAihgzsGCU747cksfY0WwmMyUOGerizoumSTzu/CFUXFV67/OH
 mrjh/3ExF96cQgjoa8kmSpe+YH3PZGXXv9EhuC8+0HNA0SoJi9wv9I4yyxQ+eRkWY8xU60NwBM4
 bewCYNq0HZuDZe2iBuC3DxZ9ujGoPtHqpiu/QVt0/RhFPJLNp44LDw4MjFnZxX/rLkssq6Pnr9+
 42lsUJAuAhiZy5eomPYsX90lhOlNA6hHcYViwyLDo5z4WuKFRiDQJJpQghpX1mhjXiyRAjb/Mfs
 qej2HMCSKPLIX0IHVH7lOpHTOlGbAQcSSmcpJqkW0xEsfbdJakUUn4514+XbG4JHcEbxQLaG7Fd
 p86+kFPpcgkWCOuQMIaP5a5TMMqOy5Fu9H6uhfhjazMMazcmd567F1DDNAOz+XiE9HgFHQrtxx9
 hkxokycLl6u7Bie4nTylRJhw+AijEATPmBZP7fiPFUWzN+YUWr7sT9L0IKC6Z/EI1QvIWw2iQzM
 VO3Ngi6EnZdtaDhpDvu/lEsW4YM57nznmIZIJSccKKyxn6GtWgOX1K0zbNyIK09oikvtCa2M4MH
 sg5pVtHIrVZX5WMmj00oU54AG3U5/LQ/XcA==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: WB3a36ENUU8uudcFJjcq_ESm1mDnlzQu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfX5yTcMfW0vIq4
 36Z93JplmcD7jwUHva3DtVMSvGCzVN/QqlNK4DCNuJkNAs2Cgiw6BHP8o+JkXorLLTZFyspTuLK
 l/qRfyoB3/rK6aLQUXzCWuEcM0Uuy40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfX71vcBdXMka+N
 0INGY7OxLqZH8RohrRztxcIy8xEFBCtIsNVy2FbByMCtj7Q8Qd1tyAoKd9XAET3uHxGPYIxN4nF
 lUq0DKIBGdqHZv4IGC/tGBp9pAbtoKJ2NHuAKO8zE9Hkm4AJhfu2EvzIWY/eTrdyoLnntI/Gt96
 2RXo0CfEtAcPQN1aEzCpkqVFPOerej5fCsEnqSUqg0g9IUrnLsLULLKQyabqEN5iqjA7ojA7UWL
 Kulw6Sj5BHBl2K3UftwywVoPu7m2JDO9jo3a37rBGXv8VARXqLllWc3whCR8ignxn/Cu/cR9/8e
 6XQgry6zcXSLqX9AXijjvc6lLV3h4nlEKIs3qdb0wFktbiAoKISf7gn4uMZ/ktOpd5zW0QibN8Y
 7GjVI9qQ8mgPIf6KmI0dDk7pX5r91Rvm+7taMIyO+//LEKPsfoKzFjMVj3rRS/I/9EzM5UDERbj
 cCBvsA8qclFXZ24GTZA==
X-Proofpoint-GUID: WB3a36ENUU8uudcFJjcq_ESm1mDnlzQu
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a619013 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7YLAdywIGHMpCUzu5wgA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230035

rproc_del() is subjected to the reference counted shutdown path, as such
a remoteproc with more than one reference will be left running as its
resources are released underneath it.

Refactor the shutdown path such that the reference count value is
ignored when called from rproc_del().

Assisted-by: OpenCode:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 57 ++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 899d2058bc45..1ed406714849 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1988,28 +1988,7 @@ int rproc_boot(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_boot);
 
-/**
- * rproc_shutdown() - power off the remote processor
- * @rproc: the remote processor
- *
- * Power off a remote processor (previously booted with rproc_boot()).
- *
- * In case @rproc is still being used by an additional user(s), then
- * this function will just decrement the power refcount and exit,
- * without really powering off the device.
- *
- * Every call to rproc_boot() must (eventually) be accompanied by a call
- * to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
- *
- * Notes:
- * - we're not decrementing the rproc's refcount, only the power refcount.
- *   which means that the @rproc handle stays valid even after rproc_shutdown()
- *   returns, and users can still use it with a subsequent rproc_boot(), if
- *   needed.
- *
- * Return: 0 on success, and an appropriate error value otherwise
- */
-int rproc_shutdown(struct rproc *rproc)
+static int __rproc_shutdown(struct rproc *rproc, bool force)
 {
 	struct device *dev = &rproc->dev;
 	bool crashed;
@@ -2029,9 +2008,10 @@ int rproc_shutdown(struct rproc *rproc)
 	}
 	crashed = rproc->state == RPROC_CRASHED;
 
-	/* if the remote proc is still needed, bail out */
-	if (!atomic_dec_and_test(&rproc->power))
+	if (!atomic_dec_and_test(&rproc->power) && !force) {
+		/* The remote processor is still needed by another user. */
 		goto out;
+	}
 
 	ret = rproc_stop(rproc, crashed);
 	if (ret) {
@@ -2055,6 +2035,32 @@ int rproc_shutdown(struct rproc *rproc)
 	mutex_unlock(&rproc->lock);
 	return ret;
 }
+
+/**
+ * rproc_shutdown() - power off the remote processor
+ * @rproc: the remote processor
+ *
+ * Power off a remote processor (previously booted with rproc_boot()).
+ *
+ * In case @rproc is still being used by an additional user(s), then
+ * this function will just decrement the power refcount and exit,
+ * without really powering off the device.
+ *
+ * Every call to rproc_boot() must (eventually) be accompanied by a call
+ * to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
+ *
+ * Notes:
+ * - we're not decrementing the rproc's refcount, only the power refcount.
+ *   which means that the @rproc handle stays valid even after rproc_shutdown()
+ *   returns, and users can still use it with a subsequent rproc_boot(), if
+ *   needed.
+ *
+ * Return: 0 on success, and an appropriate error value otherwise
+ */
+int rproc_shutdown(struct rproc *rproc)
+{
+	return __rproc_shutdown(rproc, false);
+}
 EXPORT_SYMBOL(rproc_shutdown);
 
 /**
@@ -2621,8 +2627,7 @@ int rproc_del(struct rproc *rproc)
 	if (cancel_work_sync(&rproc->crash_handler))
 		pm_relax(rproc->dev.parent);
 
-	/* TODO: make sure this works with rproc->power > 1 */
-	rproc_shutdown(rproc);
+	__rproc_shutdown(rproc, true);
 
 	rproc_delete_debug_dir(rproc);
 

-- 
2.53.0

