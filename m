Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624F361974
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918511; cv=none; b=S34C/oVM7oZBhj7Lo1DYlgzc1zxLv7xJs6Tw3A4I7kcvwzNn0anjxilF/OGYexxmerCjGjfAFiICmMvUiJ++BMijt3yiccdL4oK6gkL/md0m9SCr91Tr6SRyAY4TEix6EBYVPnoPzON696BnCCDG1c4xJaJ96rLAFw3mO9v9/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918511; c=relaxed/simple;
	bh=55+tR90eqz2IaUxGTA2uej0UqcJSGp4TrD5RgEjUW8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSHQiTgmdMIzF4LefKV4CjPczedrMIjAYIG9ApA5XtdP6nN2i0PHKOiQw0+8XrrfBrPkeB1mWPKCJN2yXxtabz185wL9F43TAMJ/TfySEHPrB5KrM8SpJME1PTRMqANsBcljbNTmSUmLnnlhiThHEU1gqJ0t7V51X6A1LU4AiDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJIpFy/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QCE1cdva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJIpFy/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QCE1cdva"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqiMn3780031
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5fBs1xY343L
	cmwVdeSFdP4qAfnYDP4WcLN7SD3Fu8s0=; b=jJIpFy/XO2Z2aNXbHOzgu/5ivoT
	I+8eFI35vZ83GvLaxzWAKEwXdFQ6a0s/4NI5z32BmEHuyiBIY5odAQXKqXpADkqQ
	qxrO1+V7261pDAu6IRV6kPnrNMiifTZ9x/2Hfm+HMQ7/rZCbzCLJ0RiR8ayQdZ48
	IIuPxPomRoUUgCuYqdwI6497R0zCn77NCdKIzRbfOpmTA46S38pCFHJWZK/4E9mb
	maMMsvAKHBM+b/WQxyHJLmFBuWXg7eQYi33iI66LPM6qzuxhN/LzTDGZLZ/BpUYB
	f6xEbQnCqb9gaS9E2GrD9OJGBbdhPyMuVYKQpUhVhN8HwolTD52GVFsAzSg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byt1gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so864884a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784918508; x=1785523308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fBs1xY343LcmwVdeSFdP4qAfnYDP4WcLN7SD3Fu8s0=;
        b=QCE1cdvaGYRV2fGxSGtmOiQTtWMfvZ21sGJO8gO8rWU5MIA29r/KouGFhEgotGZk+F
         lPDclVzhsazBnVqXOuzTuQ1OD45X6nrAyWqt8nFwpKZVWsfiYFmCMdA2O9PysgaYUIbz
         ru/+zwCmltHxcq9giYAPU6vyjkDY4J2p5eU0VEZmLRyUGM5/GLXwrk+i9HHDQoACqCVr
         zc5LhxoT+k9/Njvh++9Ws8Y8DcXex5oEij9Y6N80APcJHBF+QXq+MfeYnVbdT5NC6VZo
         Lthe0uk6/rTs+Vckte01dkucPTaWL/G/619vMJcUr1/prIFE5l0sXAE8dA0drk7oYMEY
         KaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918508; x=1785523308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fBs1xY343LcmwVdeSFdP4qAfnYDP4WcLN7SD3Fu8s0=;
        b=FlvGC6TO9CkgnUhutQakx+BgGzzMRGBmW6eSTdgV90GEW47x4+bNFg2iGCJAPN0hfl
         L2CBRRjvg5bNUnOmrS539XzsD3VvkAE3O57tTEfvuQLDV3ekfFwzNZgkXH34GcELdNPl
         0mzTyIvdM0n1EJdCc9dkHD7UgOQgTrXcE2+Oy9SJZzecBFGLCzjRofjjPGZesnOfPFDo
         1J4M+1hnECX2O5Sr39s48Osv2yFQPK8O1gB3bryTfpqH2bH53ts6ZPkv6w4B4/CIwAF8
         M/Rs0SVZx+lE2Upc9XAd0GNBiiAAj2k28wjqSrcTY66CmDdetnKz3HpSb0YaNMe52AV4
         24Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqyFWJMXrtQ/r4oPt9L63iwrkvTuL2NV5DpM8m04HhQzfr1RHMvzs25ZYTMU0dHBLkwSGgaatemTI1o2A34Imna@vger.kernel.org
X-Gm-Message-State: AOJu0YxgayfM4hCxzINgUCDAVoXnT+AcpC24Or1N0ObFN47BKX50OU1R
	RFClWnMZz+OTrKRz6+u4FmqvOvQWr5DpgEu9vBewM/YRChtT0voMUytwAYIpBS7JZ218sZ/Qu90
	nemcdvu3yEwSe7DHtGrQSnotkxkRSYkTt6Sjm2GkPldKZgSUTuY4wriMshgh9JYQciJzpVQeI
X-Gm-Gg: AR+sD13LkjDAb7xKlt+ow1rr0PiGMBQSRtK+dyMvW5Bx9buuTr8mFjnmDU3XfT6NX6y
	MrJRzGIQ0r7SNyHsk0Sq2LqakqtOU/iLn3kf7PMUnKMTsdXyOO7Twz0DJuwT84rdQBOWku4fV41
	6GZth6D+T/tuZNWLSN+wblaWSAyh/g5wVXGkBKE8HWtebR5id61oJMGpYL9HWdarckIpTA9zd01
	cgUMaftkC55TRSgUYJX0eAHQ93ojG47yv+HYVbrF8VIK0VtEDemLqwaoRM4Ciz0jXcsZrWd/pE8
	cY27dsnpvWeJiwlP+ENah+4Kt9SPA4Jto4oME2PCkDXTXvQoUixsCnWwhgtm7TvwkUOgL6PTzOB
	47x/VGY+jOvyNRlZQS1jHUxqwVHw=
X-Received: by 2002:a05:6300:614e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3c44afa7a04mr9747700637.6.1784918507863;
        Fri, 24 Jul 2026 11:41:47 -0700 (PDT)
X-Received: by 2002:a05:6300:614e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3c44afa7a04mr9747669637.6.1784918507350;
        Fri, 24 Jul 2026 11:41:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm2222283eec.31.2026.07.24.11.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:41:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/5] remoteproc: add SPDX-License-Identifier tag to remoteproc.h
Date: Sat, 25 Jul 2026 00:11:30 +0530
Message-ID: <20260724184132.1878077-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rvHoRzxmJyLOd54uR1CRHaUk6J6ZaUUH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX7Dl8nkQhRQEN
 db0Hx6mUWvGc44Elq/vpNFZavg9uqjo4hwT3ehLS8sgyfW8HCKA+zDpo4XKUSnvJhoHj3yNp06H
 yhdDhtlSmqbhaojVszNWI3TMQ5qXEWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX+DuxO5MaqJsQ
 zdqmazwEf+r992D3u6CNjJjKrQmCegfE4TN8YL64nZzw18YilIh3vxiFWKL4jYOpPuegiyJMLwU
 1doCVSdbpJvKLL1Zc43kaKOlsW+nLQ5Wl7oq5m/GZ908hWg/oNLWeBWw/+c1s0rRVInhqatNU0O
 ithYPXjEVmv3mIBbH3Yr7ILwNIEnPGT+zRlaZovlRwrwEnwTIoUKsxwDS5zoxmM9LZ1kMwSq25l
 V92ZDSQNKGO9+esRwexLJbySnuQbWNxP6cFZRUmFCrHYcvfofrYu90KQ87V1QyQ91laUp040FT4
 EXTjenWzRcAcauXEvTGKYbRaW7VPUrc9iqEwHQLHZuMat8o1plaaMwDxO38pF6Cr/qxdQFDUE5h
 z1/TuwRRf9LGBWvzjjg3zEeWgXBWwArsxl7EyuFrmQaqNEUvqGrlo2hUA5zBORc8B/gzCMcms5x
 j8tbKKQSuRU6ztJda1A==
X-Proofpoint-GUID: rvHoRzxmJyLOd54uR1CRHaUk6J6ZaUUH
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a63b1ed cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3h0Hr_wx8Ew_Xk_TzlYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240168

Add the missing SPDX-License-Identifier tag consistent with the
BSD-3-Clause license text already present in the file.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 9cd0708d5ac9..e6b8fbb0af8e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
 /*
  * Remote Processor Framework
  *
-- 
2.53.0

