Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A84456E05
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918513; cv=none; b=kreo+7Rmzaj8NxNRWzHfNvKFISKJFCBbYJfFTjLaaFV9x9bAv31umCllzVZh/L2YXFuuhRHoTvjf3MyU/EmJMgHfmJMfG96FdxDBwLlKUWt/bnpRNGXSH+FX05riiYg/4RIogHijRFDrIPu1iXbvHQ2G3jL65Hhkt3h7KwPm6X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918513; c=relaxed/simple;
	bh=Ci0FyeTmDOFK4LCTh8I+5CcNNYaAgABUA3xoYj7FDFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXhXH2GpnWOrAphSHdDTQjsvDfBem1obHtjqiZtKoLFFh2pbmGAjcJnPOP9yagJI7TFQnFhWWjPz7mqy0WQE49MOlPWG44OPdlXx9gjNetSLmnHqjUCIlI9cEjo4gQf4yK0uvLUi/LdunOlxNFGRf2BQC2sUGwt9p/e0t9hPdhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vlrd7IZw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6RIyZ0D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vlrd7IZw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6RIyZ0D"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqgPH3936772
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CbrOr2HxeGC
	QdMPjyIdRiyuBnhXm6DSlAyF7/NFtfp0=; b=Vlrd7IZwbMO/UOBDGvKiDEJvMHk
	qYitROna1nfrvta9wvVsHDeSEupUie5DLzXAsqjc80euq/SCouH5oGqYEXS6/MtE
	T5ICIdz5aZKhy1VqSr5NFOh1b9OjM90Rqbolb0DKeMaIQKFp6BbCPaBk+DMpFJWs
	1gEAHu6HpbJLrqV+pBKi7cVP8/P8QmA0f38SAtiR8w0e3q3OdQ0t6ukUvKFCs/z8
	YJ2k41pE0RUUvnCj0df5MQC3PhI4PuXj+eGbl4dTSzkDeLLgX4xrHVESlD/qixSm
	5MpSnoFDet0sgcGnyn3PGydRg3v7Q40EfBeZAIlHOqkI3SIL6sE3D54nZyg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmb6p8jft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso9321725ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784918510; x=1785523310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbrOr2HxeGCQdMPjyIdRiyuBnhXm6DSlAyF7/NFtfp0=;
        b=b6RIyZ0DZm7PNLd7QAUyIz4gQGnKnjOdLNAvQFaX8I/P0StZqVnZZjcALtTL8WIC/R
         DGe2GnrMO/xxE96GFYJw6e18Ga9iDnKI4gFj3mqk3pN8mrT9e62rJlPb14Qc5I0sjhI6
         nGED4rI+J/DGRamjN8De4Ik8B5LP5JDlFtBApA9k4htcFTE6QHQS7LP61jclY0Iyr7IQ
         KhR8XqEcg+a73jl9AnaXB6FuXKrX+cVkSBDQNJDplrH9Z2TQJPfNDJyz0Y3J5LSsEkPh
         IYFBo04rDlM9PN7IB8MnC6KX7eC9/AJBECodxqgeFfbL3YVzYyHEDi2ztvvvjmkVxCM6
         POHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918510; x=1785523310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbrOr2HxeGCQdMPjyIdRiyuBnhXm6DSlAyF7/NFtfp0=;
        b=Llz+WrWYu8BPMd3CAL+xLlNkpDhbMErft/ADr4KyI6KAWNgB4WLLmtVaZRcFii9v2N
         mWX7g8GiLcfJGSeH/hUkNSmpZUofdL+/RD2W6PM30Sk7rA4LUU1LaenRmjCDnvKe1ouX
         jBO7c8ReSGqGBnBgl01uDb6rGzpgHoXX1/UZeDZO9BKHVoTptNUafpJuUam2RMOUJA/d
         FKLAopE7sxkM8QE8ejq3Mi42RFE8Mw6zjpo1zJM95DO7SkMTOyCej3W8oSLg5/6CQM2e
         jZ2nwhNMNL5vXO8Xqt2ehMbQgvAyEqTD3AichlD3zg/VcTIBGAZefbBdW1o/J81RqLK+
         SUVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqv0gCJrzxV7Yd8+R7cQPyr5+mACiB87gKXgoxGYqsX6TJmBmw3xCLzOtaETMTGve/7VkaAYADMDsffD73W+Rr3@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdf/K1mrDKhvCw28ulzQmena37Q0Pz6l5OeTWC+LPAkkQGo9s
	4vSzMrLbbHVus5qbzNL6KWJk9Nnxhtpb3m6+Vpp8r6FfZHX9qjvd9kVBTo4zEnrvcdIL275PUWK
	JZCNohyA5r4fY45+R5XivqwjWiDRJrRjWARgv9xcfYh+99Sx4b3nOQSZf3tvWpvmnJZ9dYYfn
X-Gm-Gg: AR+sD11bFA6bO6dcCAKgg5c/yuXB8q0zEYFlT1fmK+FWhaNC25HMEaXPGiwcD/OSJxJ
	kdjeTIf9q+FyEYZSj93L4lcvOWgZIxi31BF73vRN0fjrONeZzBcusth3mBK4sl3ArqaTXuvp+j0
	YnyHLVEGA34SJP6EZjDXvLjwoL8KM4Gjoi1tNzbeTyozwGUW2e1+Jlk9DuHV3+x4OtYqa3ci7rr
	+aRJprv33RxsdtzZMvGWdgLT49/eWK4CPB8l2eL1v2upUuxqrKFd+FcVwT3DHmu1skxWfB47Da9
	1jpyTFmbhip6LaVcRec729gr63TsxqIYFczBHPghWmZZ240ug19JrC/Xz985NP+0vdxDbjedxfj
	WqylABxsavtvc7S07tJCwpt8mWvs=
X-Received: by 2002:a05:6300:614e:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c44afaac10mr9234164637.10.1784918510242;
        Fri, 24 Jul 2026 11:41:50 -0700 (PDT)
X-Received: by 2002:a05:6300:614e:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c44afaac10mr9234133637.10.1784918509775;
        Fri, 24 Jul 2026 11:41:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm2222283eec.31.2026.07.24.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:41:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/5] remoteproc: add SPDX-License-Identifier tag to rsc_table.h
Date: Sat, 25 Jul 2026 00:11:31 +0530
Message-ID: <20260724184132.1878077-5-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AureGu9P c=1 sm=1 tr=0 ts=6a63b1ee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3h0Hr_wx8Ew_Xk_TzlYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX9V37UliW8/u/
 ijXWyexdSO/92Uv6cFg3Q2r5VlmmnhTjGIa3Wk4JYb7YlhMp6ynGOv42v5a+/2HRFJZpOlyGo6D
 BmLBQCX1iFA53gCOgO5hogMRHxEDFZM=
X-Proofpoint-GUID: tFVboAv0pA7t39WcVYUnM3Jqk21VH4JT
X-Proofpoint-ORIG-GUID: tFVboAv0pA7t39WcVYUnM3Jqk21VH4JT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfXwPCJDcmdM5q7
 DihDoc9GvTIJZlY6QJwx9i+cp3vhY6ajwXZU3nbJ/nAZMkVq6qKlH9e2rIoCvHGjTEUhez50x2/
 MVNh9V1utbE/r9GFJxWrlkB8F38jWVoyZyRvvKfI6ZjEALTKQI27iucIGyN8PiwzASOmvj9xKus
 FfHYForGKJfuaFRgZEvEReMCpAuqM/K6ofAADiup7QFGGNZ7qfznXpq1/HjrG2vMsnQJcrDQ7np
 3Ty8aDSfldqjahQ47YZBdwV0+jZ68Nv/Fp1dyiuuXagUveVIfG37yeHRYsvcgNfQc/fvsO6Hy4a
 JkwLQrzdFp0Vlhd5O4eQvNtoQY31nGWara6ZAnJ4sHdllkinMOrHwOYqUjWVyCgcA5RU6OhQtDi
 F/U7kckf8x4ITWqva0tnnccPkY5K5QqrM2uzU6cl4kbAn1OZwxO8IoTSCl/NOT4iIdyGL+s4x8t
 nlziTpoRfVDOteKGI8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240168

Add the missing SPDX-License-Identifier tag consistent with the
BSD-3-Clause license text already present in the file.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/rsc_table.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
index c6d6d553d8f1..b78c4760d83e 100644
--- a/include/linux/rsc_table.h
+++ b/include/linux/rsc_table.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
 /*
  * Resource table and its types data structure
  *
-- 
2.53.0

