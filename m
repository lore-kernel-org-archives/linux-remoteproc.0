Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2B32C945
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954294; cv=none; b=R2vyVDTd/0d2/M1EGX0DxPEv5XKjkds1woEILKO3qghUT4UqiTiKmoi4JgeDqtDc/io7SUjMymYxyePT4XQK2FvXWzxXRjrnKZWPuokcWr5xb3nd+iPMMWzv4a0451yoC9L489s/dEkqftwGO1crlgYHGeFjNmvNIRn3zgDN0O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954294; c=relaxed/simple;
	bh=n5Sih3s6jryc4fF2MY9dv+Gd+rAfVNaFbJvhtbsBlRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBdDpkccyJsaIXRK3OvTXSuQQOz1d55PUahgQ25nqL9/wQgTOGtowRzB2pEIk9o5rOaBPvPMsUSv+cOzZFBXrFG4YIZl4GO1f/ZxzEeY/hM0yv+L1zyKMK/JS1XBrwRmLL3fVHqMPQtZDgoqtopeZBap+Axv/NDbHFQt0HY4uJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5g/UOyj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwiB7uWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5g/UOyj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwiB7uWE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3wBKi1903688
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iEXzkIhLRU
	2sQ9AE5qIvZK9w6C3kkeCAzjrneXwTAA=; b=W5g/UOyjFYjrrGewB/wQNKJfm9m
	PLgYFYKYftWriqqVUNEAUQ65OrqjDKBlR/nuUFx2mk+v13DmzLWAOi4MIjLMLngl
	R1SmDSriarL4xw2FGc2qFxDjzraM2JUDs7yqndpNav8t09cKF49cDmI48ny/RUeM
	YpB3SKjqbt+jb0eWgtRQ1bMFynkjHLDnetWZJeKA7xjwz9WUJwn12joSJu+/eIkf
	YdKmSed/6fhjgbX1qK84xYa0PTPc8/czUF2ZeJGAk1pWA8s001Q93U57BPWTObWc
	RJFkO2fguilcj517dVEUGVV/qGf1O1xr80VE2aeMwYY6e/1ex+5xaEySC6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n330g93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f26fc6476so83338225ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954280; x=1766559080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iEXzkIhLRU2sQ9AE5qIvZK9w6C3kkeCAzjrneXwTAA=;
        b=UwiB7uWEe+H7C7NUL0+08TCprWb4pAyR9sbXykmPG1Y0jMlN+hQniQ6jzcs9t/2JRw
         1coqnSLUsRK/+tjubqjpeGIxUw/vs0ipQzZCkIt+cXBNHxn6QyJDnbN2c7sA3Hetarqy
         eEdLNX4zRev/KyEPbDXjZ0ZNcSF7GKjMl8zEGBWlbYB1gCaz70WvvCUC20kPpcKHS5sq
         +pXE5uuFJ2c6JYIEdzUKasKtk7yvqpE9M6W3hnsDsuIIGTkuwcgxhZm3ObhfpE6BfBl8
         wXtnIX7Elm9rL66UPeMikxa1muWkjxlz691Lk/z8znEy0qi+mDYGsz0mLvd9eBbfKEZF
         Pmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954280; x=1766559080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4iEXzkIhLRU2sQ9AE5qIvZK9w6C3kkeCAzjrneXwTAA=;
        b=DS72HxaaUSiqIJg6PlFrKMh733a68MNqfvuw4QcLIIlMjGqJIsDL8sNJSwCVz03m8L
         6U4SVsfXRSQa2ut/zP4eaQyFc5IH/Fg1DPopbkRSC2NU2iNjiR7xmN8V7MrNIjCYS9xz
         6klBnqkVjdR9WBds94NwmvCe5ACHZYsOJwC7iDO8ZLYFxibxJPPxrc0+0em7f1XvnuVP
         4AZldamMGCW2oYefscFUPfFPjnRGL1JmyOsRB6owtTi5P8hyKrAz8ZcYS4p+ZI5beFDE
         btFkzuK8ufooKrVPpn0JQliXaQ/5E+fNfknGi+aYi5n0XfO6zZ3/2zWT0t2AfcwcP5vB
         pB+w==
X-Gm-Message-State: AOJu0YxO5ppZhOTQS6/njOMuJyn1YwleIKuR6nrfj2KDEtzgl5uqICjx
	a9b7T54rUyT8QirHQ2VI5W0l0UdSyzBbYOcijlIRDx6vLFbSkJqfGOzOsY6zuSYuHq6FxcDh6FF
	lBdsC02F2l87dMcbICZCRRDlWQgjOdAoGzjT6w36II2Pq5z/6yq+MH04NbwtSRNgKROOK/hxk
X-Gm-Gg: AY/fxX6+j+192VPVCQVcXn+JGbmfniuu4PUJgiy1WoO6BDP5FTUYI1YY5OUUqsdANVx
	JluntYpPON5UHFnr7PIn1JdR5M7vy8FgMuy4xA13O6PC+T3GsLMyTBE3wKUkB0R2uDdeeVnbLd7
	IhBKtwMQE52BlTjGu77NQSazSTQJUb8FxahERERZhgyFMVYW2ktiQCfo32l6lqPotynChohL593
	niOELvx5o6B0WNHZi5q2sa0GefEFUfO8ILXpu854OtN18bXj47lIT3r3EqjZCLvWwyja1isqpLh
	MIRBTBp6pH03wvE6u1+PGKKISG3CQQ0nl9MxDJuO9Lx2L6T+bNzvkrMxYy6KzUozsyX7ghsfyZ+
	8UzNYrLpOM+40BRAK5136Udln91JQUqyjX7P5jHM7WiEVjiOwC0EaFRHTjLezoDD4MXUoCFxSTt
	ro
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr156682915ad.46.1765954280362;
        Tue, 16 Dec 2025 22:51:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIbB9Knwe9bfEuTzW2OVz/ykkHTd22n1PPWbVEsjNZs6oAXaLe1AKuG0gZ8WAQKZuVACtHPg==
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr156682715ad.46.1765954279899;
        Tue, 16 Dec 2025 22:51:19 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:19 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 1/5] rpmsg: Replace sprintf() with sysfs_emit() in sysfs show
Date: Wed, 17 Dec 2025 14:51:08 +0800
Message-ID: <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX1OH1CrF5ttyw
 dLeFo4uRASEO7QtD714B3VHJZTU79usNrybdewOD/lcFEN850kVKQYInYl0/z+T+N7e8MWSEwUM
 cWD8dRfeS8WSKW+uNjDYmY/8bwRcqAMWoHxDu4gEKm9BaI9aK0OwKvNC0cmo3irKWBayL6IuRgc
 Vz1OzGbjf4w0GcQcYhSTESn6fgbclJqSmUcObkmmxx9N7OKGj9fmWxicXWKv7ZsqnmNMuak1d0d
 vCimYOHVgeHtVsJF5kW38kRGWIuGDQuRE/5OP/GAyUzcxnf4elv+g9H+aRnWWQIkdfiMe+53LtX
 hElfQyPt1W151k5Q/pca7kCgsaw8RxL5axEeVwqYxfqP9ccqrtk1JgCFT3t0sdvY8dj/tskYgsm
 W0JGAjUAZyl3yw0VbHHGPxvq0RealA==
X-Proofpoint-GUID: YC5aX8ypb98vi03kdtpf0aoyftdHv4Yi
X-Proofpoint-ORIG-GUID: YC5aX8ypb98vi03kdtpf0aoyftdHv4Yi
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=694252ea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zeoL4EY6mI-QDyTLeegA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

Use sysfs_emit() instead of sprintf() in sysfs attribute show functions.
sysfs_emit() is the recommended API for sysfs output as it provides buffer
overflow protection and proper formatting.

No functional changes.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_smd.c   | 2 +-
 drivers/rpmsg/rpmsg_char.c | 6 +++---
 drivers/rpmsg/rpmsg_core.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 42594f5ee438..2793096aba45 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1458,7 +1458,7 @@ static ssize_t rpmsg_name_show(struct device *dev,
 {
 	struct qcom_smd_edge *edge = to_smd_edge(dev);
 
-	return sprintf(buf, "%s\n", edge->name);
+	return sysfs_emit(buf, "%s\n", edge->name);
 }
 static DEVICE_ATTR_RO(rpmsg_name);
 
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 96fcdd2d7093..3287e7941c8c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -365,7 +365,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", eptdev->chinfo.name);
+	return sysfs_emit(buf, "%s\n", eptdev->chinfo.name);
 }
 static DEVICE_ATTR_RO(name);
 
@@ -374,7 +374,7 @@ static ssize_t src_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", eptdev->chinfo.src);
+	return sysfs_emit(buf, "%d\n", eptdev->chinfo.src);
 }
 static DEVICE_ATTR_RO(src);
 
@@ -383,7 +383,7 @@ static ssize_t dst_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", eptdev->chinfo.dst);
+	return sysfs_emit(buf, "%d\n", eptdev->chinfo.dst);
 }
 static DEVICE_ATTR_RO(dst);
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 96964745065b..bcfd17e5309e 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -348,7 +348,7 @@ field##_show(struct device *dev,					\
 {									\
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
 									\
-	return sprintf(buf, format_string, rpdev->path);		\
+	return sysfs_emit(buf, format_string, rpdev->path);		\
 }									\
 static DEVICE_ATTR_RO(field);
 
@@ -395,7 +395,7 @@ static ssize_t modalias_show(struct device *dev,
 	if (len != -ENODEV)
 		return len;
 
-	return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
+	return sysfs_emit(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
 }
 static DEVICE_ATTR_RO(modalias);
 
-- 
2.43.0

