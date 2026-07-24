Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AC29ACCD
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918506; cv=none; b=mrvQZtORYD1YXi6gUj6jTmXLAlp4C8+JPzrF9JWyCIwoCs2d0PScUfVOSbz6F+CBpk5qizas7zm+OJnzWbPiJT5ro4Ut0Sd+hjT9RzSV65QSB7Xzw6V5KfZ+MJEK9wklESDGgOdI5pGAeKRp6BsnS/jwhT7OtP58zKu0sUXMoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918506; c=relaxed/simple;
	bh=JCmeSVzmx8Z1fxr67ObLjRBp3JV51TF/TqbnY8s4AaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jO/7lVpZuDXApj3wAp9jKQf+6dg0VhleZcV666H63DM5l0N8vDwo+zCYhXEQW5HkeboM1+aBKn6RsnDhmU2xCEbcUOIv+a2aYxnssVJUhzRHAUkKhmcNKsb7JUQxLHaOInVbx4MjFZFLw9ja53vrBJOEfxlvvKvH6lDoYgkvC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha0W6E4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OD/vH2fB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha0W6E4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OD/vH2fB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqjJJ3537512
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=El+qEt/s1f6
	ebKNkUnRcrxMO3iK0ud1hr3B4YELP85A=; b=ha0W6E4sn4ux85FRLmpliMfuZKm
	1ifqmmABBtdeRKdPz41RwJ+PAUdyddr0XxaWiobI4e7wsTj5tQ6oKe2zazv/Nmm6
	PPGU8KqZfSLhzB6802wxl0yynb9NtLMIak/MTH/xXppYV7ApnwutZPKGunZtZ4Lb
	1WPDpJ6ysAegKaQmWF4FXR9j3ZbhJonPPSbC4gp1fAfN6Fiui3zFq/6t4nNoE1Ba
	q+c4NOXYT4WmAVwp5WudxbjJDoERJOm5xWHSxkBJ7q+PtZmsE40EA6x6d2BbBqKz
	Nw9ri6J6btAomW4dQajoXIZOm7J2xJ5su+v3gbKDD9BQT3PACBzod2+mvtw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgh8y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so992891b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784918503; x=1785523303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=El+qEt/s1f6ebKNkUnRcrxMO3iK0ud1hr3B4YELP85A=;
        b=OD/vH2fBWT3Z6rkZqJr9VryXsI1L9o1Wc8zoi5O3Z8dyA52hlp1+uH9UqgVsVfmN53
         +QyRf+XwV8x7NhH8sMWuvGBUHSoUa79cPNh45KBzwgkZfQ5jn1aAacOdGi9K1PWd2jEW
         tWSQ0wNd+ZGTC95hhPbzpFy1CDgIVf1XyjhrNpAbm21EBO89Af/dbNmtfh7erRFJpUIz
         tY9oUD+kHgvKhtQMDC2rD9s/o+n6eoVMMd5sQQ6kqFEd8tHpzvv0amrmfK3yegcLrDfh
         1PeAUUi0/7yoMVOAEv00DDttsmFV61tjpS6+N6ErkBxNv4ywVMhjm4M++4dnHWwUwQUq
         4vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918503; x=1785523303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=El+qEt/s1f6ebKNkUnRcrxMO3iK0ud1hr3B4YELP85A=;
        b=LtjeeVdABnQXDXO8yZ8/CD+09ePJHVXWdtYCWdyVVjIiy4MbU+zfcBF0Frz4qpaKvL
         x73No1gVay39a62cEbsd1yp40zuK7lDhk6O97wue/MWyb9965acLZ1D4WQe9tkXD1CK8
         7qAlzDfMLYkCqT9wz/+UGqHTp3wyLKe0rR0gyqzuWRe+hmpa6oeyBzT7A7q9JMHZlgDn
         I04L/llE7L9C82Lc+h8T7OXKfrKsTxvP4TTmA50s/zKF22CYJQAhHb+drycR06EwHsKJ
         oBuK3DXxXmef+4Uy5MQjdgKu8LBZikqMJmlnexPFy9HDkvose/lNiA/jWnas7lSPlF7m
         WDow==
X-Forwarded-Encrypted: i=1; AHgh+RpmxXKVlzWnmFwjYaNCtd+jocL4TrLf3ftu03JBhcJrAoKQEbGO30UaJYhB7c4Fj9K57+fPKUVnvvMkudwkI575@vger.kernel.org
X-Gm-Message-State: AOJu0YxjspAHJjOlpuP/rNtLMssJT7DYbsKhbaQrqwfYyWTSH23got/z
	tbIoW1/8k5P1HJpaWkA0CaLY36KRVM1+vyYIug/Zrd39YT/dqLz3+mY88VbdYyD2R9QGTZsfRMw
	+LcIwaMxX+QH5KDJe7qXnmLiDWFQDoDllnAmvnWnoMuINAhVBQ7wPwKI5SBk8ef74T8V3UU0l
X-Gm-Gg: AR+sD11cHum8G6JCZyBzQb1WPyfvZR7b6pzKE1cxmA5NiymDPs2ws+t1RU+3ibAcVrQ
	aJYfh98DK1w6utX33MFPFs11cZrkYDlyUzqwusCzrTqMcPILxtKfPAOYQYSN0VbSWwoFO4pcGgQ
	vDhZwWTt+8HR1rIcBSaF11ZCGSg925GtHxSbQ0XQ4IQY8Q/QCSo/5v8LGIqEDnWWGMgMB8swFo9
	32BVLzog4AEYXsDGlCCqff5bJU5n7qkjXkbQrFcp9W2asNwNGBDvXIB2MroFi/h648Dd+PzYxWc
	TgLMs5n3YHovtOYyZETmUxwp3tj80WIBxEUde4hGxmyKSbUo5pMFCGQg+duiC/tYkTX1SYhFbLF
	0Y2ipuR3ItPhfICTYy4fyfNJ8cP8=
X-Received: by 2002:a05:6a21:407:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c44af7751cmr9026032637.2.1784918502436;
        Fri, 24 Jul 2026 11:41:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:407:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c44af7751cmr9026006637.2.1784918502013;
        Fri, 24 Jul 2026 11:41:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm2222283eec.31.2026.07.24.11.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:41:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/5] MAINTAINERS: add rsc_table.h to remoteproc entry
Date: Sat, 25 Jul 2026 00:11:28 +0530
Message-ID: <20260724184132.1878077-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NyBTYWx0ZWRfX4Nl1cujoKzAj
 9+jeGVL+AmNPH74Vd7UN1QCcQx4gd0lsSE15ZCeoKdS/BXb/uluzbeXuoOEoUvHszt3UvTzW43B
 p4AkU1TW3kW8iCOdEqVMkwWm7bcdBi/XJy0mc3mKnlcKZVRpgSM9N4Maal703wg9EoUs7hbH/Uw
 3EpmYNVZ4YxN2elwkJ0lL6g/OOIM/3SNi4vDZI6PJcDMZwVtmwxDVSv4RrDurOf8e3Ishjw5D4b
 5jmisG15Mtf+onmFtQJ8yB56kJs7ai1nvENPiyfupDeOW0IHubRytVwcpV3ARkoiDSuDmBQjnFQ
 ve90wC0Glh0VvbHgVcjG1NFpZiHR+upUMFnwnshHj1cRQUndq1jLropoaD4+/MhgW0UxR2uh/3/
 t52Y7Xhceb1kS4yLWJKnIQJmdbHlSMs0jYIXqMuFQeNZeBQlPQNPMN2tNrFERedBE1wRtgPRp3G
 zgUNLT7DQZEkV16PG5Q==
X-Proofpoint-GUID: kd5RKZkrI5q2wh0PYjg_65gt2WGMXdPC
X-Proofpoint-ORIG-GUID: kd5RKZkrI5q2wh0PYjg_65gt2WGMXdPC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NyBTYWx0ZWRfX+JPT3L7sKI01
 /qVDpAzBzuH08vpnF0z6F4OYwUdiDm342Lih2kVgknWfxK0wa71Dc/2plLtUwx6v4MqgxO4kQTO
 TagSy2Ou7P9l1U9Hot2mqYsrIhK1s8k=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a63b1e7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ob-EK7KtVxQGSle2nTEA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=ZXulRonScM0A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240167

include/linux/rsc_table.h was split out from include/linux/remoteproc.h
to hold the resource table wire-format definitions. Add it to the
REMOTEPROC entry so it is covered by the same maintainers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3c01eecfa2..c1d49922f523 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22952,6 +22952,7 @@ F:	Documentation/devicetree/bindings/remoteproc/
 F:	Documentation/staging/remoteproc.rst
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
+F:	include/linux/rsc_table.h
 F:	include/linux/remoteproc/
 
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
-- 
2.53.0

