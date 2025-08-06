Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE129ACEC
	for <linux-remoteproc@vger.kernel.org>; Wed,  6 Aug 2025 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501152; cv=none; b=FGnDrwMBQjrDVcMGuTDt/XNnUlcNuBmrVpxxO/rHGTa+ZlgaJiLM5R4JsdBQ0eVDuIe9j+J9FNrTb/F0y4p3mrGoxgaRnuecMH97ziUHC6F3MdvU9iFih5AxBzi0XH98stguj10DS/6A9vFTDy6XhOSmsHrcNcXIcF3tYbsjBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501152; c=relaxed/simple;
	bh=Cnfe81ebyCIk8w/h4ZV2DZyd5yj+BwIO3eFpimyJFZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6lB8G6ZL5GEnWxGesUVDSwMatXoQjjt75iLCcl9i48sb3jtlFPgK9DWHQx6oKOBG97wT7vn/RWTXJAM8PBM7r81+6fH+Dn8uMUDM27N4VyhGVp3B1nVbBkoK1PolFoRe053T3mHZKsjGiCkh/RQ04bjUmRd0+F32bFEKNt8zZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VD9wmOYD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD9wmOYD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CvUWE032054
	for <linux-remoteproc@vger.kernel.org>; Wed, 6 Aug 2025 17:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVYjI3rygCGwLfBirqa4CEGJ+oQnrEt/kpH
	x3wnKFJA=; b=VD9wmOYDlZZ+wc29v4hP/QvVEoydomsDECUYB5Y1zl0BtGGRDkJ
	P+YAyEndBnMQ8OHhYtRBrutJ3y1n7Vg2c9VVg9zodZSMZm2lS3gOB702edLcEwhV
	E2D6zOV7TNDtfFiqe2UfHIWSc6cCQ64SK0Jm5kRXvjDncqBYfROTPdVWFicJpIpk
	F66Ul9V0uOENdBAjNAu/Xfm3jAacB5wcA3g9UP5P6asEGd6bNeW01uO3GcV/F11i
	9RMyMZUIucIJ9rnBNGT5sKR7kWVN9RA11ng2t3qB0R1RJdh6JGnlT8AyxuPCZ1h1
	YIeMkReASIUPcqxqd7h+QObQIS6nD23A2qQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybbkeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 17:25:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b42218e4a59so39418a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501147; x=1755105947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVYjI3rygCGwLfBirqa4CEGJ+oQnrEt/kpHx3wnKFJA=;
        b=uWhORdz/hg/biiodWXOjrYwkklq2nJF4lmKDfmCUacf1e28jmWk5kbX6F2X0v0Zt+E
         SYuPtnYBmtvOL3eoKBtjQUe9ZCcYi2jJwiEapB7DLHgpoqrAYWfCCkWQb8XMdeafB+En
         V/5O4FFXH5lZ+SCLrjJ0IQO22lsnyc/9w9trEdhOMzNtrXEYusX3sCBL0KKTYproOeOt
         uLmfMZ3+cKq0tQzuCDZvaIe/NWvsK2cky1ZPh+cXQ6REGF+GOe3F81gmNPvr68F0E7GO
         BT1Nn5LsF2EzuewtvAKKvffx2m0jjJvrTTSEqjhMuOMQH8osScge2zkdQyrmcxZGBPB3
         Azrg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ViH3d2bKKeEB6d9kY0vkn0LN+wi/Qzv1uoYWMGErWA8soUmoXFyvn6LzE6ap9/K9DfY64CWMnpc7dFrUAMxg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5y8ckJqjQ1zR8pTXSWY7lwnwNLVlyiExU9detAch1V96sTEj
	Vt62h2V1M4WVNq1RHzlwCDJeyii2AzNdpihSmxywciiVV7uABg2eHhtXrc+23dD3X6Q+Jgp6A8B
	x+6N66eg7HwNo9wYhIpbM/CmhHw5szuvR01YD7SbbQOQGYg9HTK86GfC2feP8cwQEKgWbxsqX
X-Gm-Gg: ASbGnctMUw1dgXlUbvbYDTTN6/lMqQ8f9EcXBR71d4+huDVZhM0kbMa6h6SMhnouwoa
	ukQI9xZrwFyr+eUuvL2yL8se1rhLHy1diXe8hEV1Y2sTXLv3xqbp4F2kl3seu6+attj9KjnNW0p
	Zkh0u30V+GtKiycXfvglwxLATIvtw741NJsXBSQSWZUHcpUAU1AvNqxFd/g8zVUkwbbOF+Okg7V
	+VdrFVlpILSaj/KkDYZD5BLfYKO6eu54V0sSZPdBxEMazM0HY/0LUeLN04e2Oad+nF4L87GWqsP
	rEm/yF98bf20+iC9dyRVO0d/yTOxHLnuUVxbDeMIZVxy3Q8Fn7NDwtIjmoeUJux6muA=
X-Received: by 2002:a05:6a20:6a26:b0:235:2cd8:6cd1 with SMTP id adf61e73a8af0-240314f8cc4mr5563450637.34.1754501147507;
        Wed, 06 Aug 2025 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu+nPMT7IIoSPFhOuYdFJmJMRBwrZH5TbAT34dZUvgIdZmjKpP2Xiim6bvjiybrcOPhuzQjQ==
X-Received: by 2002:a05:6a20:6a26:b0:235:2cd8:6cd1 with SMTP id adf61e73a8af0-240314f8cc4mr5563397637.34.1754501147071;
        Wed, 06 Aug 2025 10:25:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:25:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Date: Wed,  6 Aug 2025 22:55:28 +0530
Message-ID: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXyFzt/K0CpNYd
 saLC8X8dqB8IzPHHpwvGd1J/AlNUVzMSP0P+0vj79BSjeNBeixXk0PQ1yvts2nKh903KmhHo5ho
 j8eLs4tFlof9Oq7aNMXcL7hYWIIkZu4/l7JnY/AICOWHadp+e5dtT45IwFfNWDAVdgZ1b6kRNHt
 01OW4oir0Ko1P4SbSJI/K4HTpN/W3eQs2hmm5pDefxFu8xDL9u/f3EmSw8pvEvLJUZNn85e+cqk
 ImjmSKTD+V291nDymOiWtGU9AyuVx0IRNd5sV5882QDGYNkp4syuok9tD7mw2B0ALNjX6XVTER+
 iJFn/ny33b3E4B0KIPYdv4ZJAQxcXjUJIkab6ajIJ3ek/tqzDJ3PCvqxlijqFoOwRjfwDn8dkhw
 3M414Md0
X-Proofpoint-GUID: y0_EFP2CQWyXlWdk_wVwyTJyM15qyHe6
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6893901d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o9fwi_DDGJO2X54_KKEA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: y0_EFP2CQWyXlWdk_wVwyTJyM15qyHe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Firmware binaries may lack section headers, in which case
the e_shentsize field in the ELF header can be zero.

Update mdt_header_valid() to correctly handle this scenario
by adjusting the validation logic accordingly.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
- Make this patch as first patch of the series.
- Added R-b tag

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..2a14ba9b0fb6 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -39,7 +39,7 @@ static bool mdt_header_valid(const struct firmware *fw)
 	if (phend > fw->size)
 		return false;
 
-	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+	if (ehdr->e_shentsize && ehdr->e_shentsize != sizeof(struct elf32_shdr))
 		return false;
 
 	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
-- 
2.50.1

