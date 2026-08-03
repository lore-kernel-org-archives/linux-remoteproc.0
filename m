Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174E403B00
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757422; cv=none; b=kElBHiS2RHhXNVTVK1U5DiXaVCG/pemYdSZE1IgpnZRv81XaEqqnMpnaJ5UTehXzkFjdWxJJtQyGcd9jkzBIJrsUXm9spNEP1SdrMGVxeqIg1Wd1zUwcegY1DmDKgiEep3iXjOtRDlBtQi0upBm6bz3LUIVEHhaSIputBXdYoDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757422; c=relaxed/simple;
	bh=XcDyHc+iSv4fsTSHHAOKUYjs6smr7ovPYCdxmXqyenU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzF5YhfxMAQQD30p2xC4hgyi1L5uOUGIBXXA7cbw7mz3RnLwiwSxkxZEIKQFfEh6B/Kl0xcC/p2ko/2agWberednIpkA8moHxDhRmp9NVvWncqgXPOrg8NebbLhVai5FSud0tT+9OES3dlzJ8X7xvTBgXdmKXJBilNTpJXDfzsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rh0kkQui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Acey8hZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rh0kkQui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Acey8hZm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673BXcOX4041882
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 11:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=psya+kP+SLz
	PLCkCdsQbtDNZleEuaNlcpVwLASo8kns=; b=Rh0kkQuiAkT7qRyK2GZP+1SydgU
	amcK6VVyvWxLkrMNfA49llx+J1ZxFxUkVRXD0ACdGTRoCL5AbX/k1cE8KTHuPfD1
	QkjGrQUU+2uoi6S6vjmRZkXnq//+AADuHn/2ah8GHxkpBKspMe73QO5ouYXd9hf8
	PMlMfwTSaOdBi1RaoZoQDDUfRc10O+8zJD7K/KSSWZHVtoucUPZ61kP6XRsq/LdX
	/rZ+pq543XXjG9tTTRB4L9c/BP+eNSB2IMahwafEovM6OepSiTB+UKL+bE6MOhgu
	G1ltd2cNVRbLoMX9O5fVzGloRrROCUuxmbxN8+IP9ACa+zIOG6m2GH8PNLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnha0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 11:43:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso42603705ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785757419; x=1786362219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psya+kP+SLzPLCkCdsQbtDNZleEuaNlcpVwLASo8kns=;
        b=Acey8hZmHbptwkqemyRoD+N4jK4VDa8cK82bNwso9jBmm05e1tpn4Qs88cGGjVfA37
         CfHlhT9FU74dnHMfkiNfTpezDpHtOJSWk95J54qPkyXqyAwxjYjKsWQ/OlrFIX6dJ2qq
         xo4Kp1RTV46ZZC+LtpMGmY7Q83HNkeZ/8RkwTKmY6PRVVNpaeBmuT/99iUIq/1aQf7U+
         ckAhA38x1pEA1cP02241xZVsv3SXLdOVkHk7YdKXsQgAN0L/Wn5ISFZwSn4/i9CK6YgM
         xeu0NgJrvHzU7WsDa4rp99wZRUizfSiYQOpuLl5m2Hm+JvJA/Qztq+QKN3c4nJMJwZsz
         89vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757419; x=1786362219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psya+kP+SLzPLCkCdsQbtDNZleEuaNlcpVwLASo8kns=;
        b=J+OQZB6jN3hPA8h7DFl0P+FZ20QjPpoegIQxTN+Cg3gAD00tJMmJ5KiAYj8igt2b3f
         ezFLxGSjuAzuDF9stRE29uwiuPCImraZQ2rKw/eLa07lL8U7f3zoVzNFNWaiyBgh1zzu
         uRa34nJaF+q8G62W8mUPdJt6JFRcwTNj4nJLL1gsZkEfmNOcBXtVgGvDjiaxeFeSPkNu
         9Q04TdDuR06tDdTtwWLVG92BFcg9mC/qMdL5x8gzRK0hc+OLqxns5ylz7TfAKPS9N7H6
         I0IyJLXALVDg8nHkAFM9pQgoR3i2Q5rtMitTRkGiureohUU26je2Ty9naAWx+zEOIVt3
         iqrw==
X-Forwarded-Encrypted: i=1; AHgh+RpZXaKF1rI1TT/nizSbmnmWCT5rumaKKdR/obUWT2NzXAiHAfyqo/tYEs5XiAff5tYSXq2r4siL61+32muUSZUo@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEI31anAVqWCC47Xn+TQY2GB4l52lT9InganClcQ18TTD6WRx
	iOb7jksu/OTy5h17XOiQlXM8RlYLE+5yWAJJ69yuUnNmSJjQh3C3SEgP4xnEPPthhLEPPH/0jt3
	7hT/jl3Tgnzg5SMGCnsnhFje8aJ5CUFrGyaGuGynRQg7ILmmNL6R5dK3QnoivS41MIcLtKlJk
X-Gm-Gg: AR+sD13qFUfcI6evaeOBlYMDIoCcqMbkskTHPdIrh5izryKjlezf6PcecEDA8YcOaM7
	M2n53eCr6iod0S15HD4mjUoX4VNCuQyORv7iB/jCEmIGXsSksFHes3QtHW2ireInZ0/PZbRCjs7
	B3Ag0fsE4o7sYTt4PJriNzXZF14Sj7KVXYhlyUrkhmWVr/Uvr6XZ9NqTIVabCYDxzY4Czk6o77v
	RruAnha+7qED7Hxj8sYXE5TNOQZfGS8PcZO6+Jl1IKXGRiXq3GfpOWMs8DW54DOVGTOmFfG3iwe
	V5MPGJLHLirprQVENY7el9DWQGRas4oKScatxJ9gJcMTQA67kggAj4wzrxnvpRf0pfGxqTUWdK9
	qL9W5nVtnX+6gmrSN7Lwj1/YLfh4=
X-Received: by 2002:a17:903:2407:b0:2cc:9a86:9c42 with SMTP id d9443c01a7336-2d0524ac403mr103970555ad.45.1785757419509;
        Mon, 03 Aug 2026 04:43:39 -0700 (PDT)
X-Received: by 2002:a17:903:2407:b0:2cc:9a86:9c42 with SMTP id d9443c01a7336-2d0524ac403mr103970335ad.45.1785757419018;
        Mon, 03 Aug 2026 04:43:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea83fsm37110735ad.45.2026.08.03.04.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:43:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 1/5] MAINTAINERS: add rsc_table.h to remoteproc entry
Date: Mon,  3 Aug 2026 17:13:27 +0530
Message-ID: <20260803114331.3277263-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a707eec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ob-EK7KtVxQGSle2nTEA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=ZXulRonScM0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: PLqj3NdWN6CauI2OKjrs_sCppfvz90qK
X-Proofpoint-ORIG-GUID: PLqj3NdWN6CauI2OKjrs_sCppfvz90qK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX30Eky3OVcBvd
 47vHABl8IxOJAQnpN4vuU3K/OvUviWGnpvcR+qQRXE5v7sGgNMiPz40+FvFcwio/n46s+a/iWlA
 yojnRgGIUl/Ku/phks+7bQQHNSgQ13LfdI77lPDxhvW0FAH4ysQgbzggRf2asnGI5z+QkaBpRrM
 M2GioniM9s2F6kzjyND0aXE7hdUQnt9UpEnY4Pb0G3z+6BPcSjqEL16skMx7mkZLEbwFXwsL/iw
 yeXltfX1b6EvyWH4fkGhJm5elO9GVtGG2VvedAFOXehnXOGSP1wS4JXlodYl5Y1nZnrWplX3SeY
 ehvF9783O4YySCvN+AY0PDMhEI+U+4Ulteo+lsR9YSGQt2rodh0D1JQFP3D/BhGYSB4ma0MY8dc
 X5Kyv4pCHPJbZlk9gUKjwCGfqced6o71fhGZg7mKEq+sswGxYX2Mj5X5msV1A3TKTeTOzZm++Iv
 opUaCRKebeC8brObviQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfXwb1bwd4c5WZJ
 JCOpHfZ6L2z6nz48xdFGWmVgOaQNNHpODUwA3f5wsxXhC2eKvExssfbuAlsfxqsDExocxh1xz58
 mgACZb5P6Muj8lev3havueo+9j94eIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030105

include/linux/rsc_table.h was split out from include/linux/remoteproc.h
to hold the resource table wire-format definitions. Add it to the
REMOTEPROC entry so it is covered by the same maintainers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56b337a06447..433d737dc595 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22957,6 +22957,7 @@ F:	Documentation/devicetree/bindings/remoteproc/
 F:	Documentation/staging/remoteproc.rst
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
+F:	include/linux/rsc_table.h
 F:	include/linux/remoteproc/
 
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
-- 
2.53.0

