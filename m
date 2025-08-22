Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45959296BA0
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856853; cv=none; b=oUHYjsV/pdAUMPgeBivN+QdNL0YFd6HZrShSLxVL81ULCmvFtKVUEc8YuioDpOCglO128hUQv8ldokd0XYf2UGiL6Ul009DGYXI50FW27dRd1DsiPIrSrJmSO1uxU/7XNlm0HqzL1Tyrx6pJKs/XUeSYfkCz4AGL7ciWE7bkztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856853; c=relaxed/simple;
	bh=IN/9k5eKqvtwYiC4dwIMx/h9QOJQd7wmJS/BI8UgYf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWRAV2r1B8pB75DPRYlk+laJqpEvGP0mgzJYJv5WweFYaWiHfGwAfOEuFaoScxL0ci1gf9dXHg3pBWgtQqfN1BBwbCzGpBM2opSkcdj0/AI04BmioxH5xk5r3WTU59qNxSlwGF2QewjxSXy1v1CbRwUS0eGOVFegD7HxQ3MeJVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFTWwsQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFTWwsQZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UUgk020987
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BiZ7xasJHYty7KtFQNXG24FyU2/Y4YICeik
	S15YW1Ns=; b=dFTWwsQZE33huhNM22tYIR9hkj3HW2rY6o8hm00mkFWtEL8D6B3
	Y8uYQ5vgraV4gu74rdNUN8J9AXYrVktpEm3nldFHgTD4573R3qp0HackjJ3B2ag2
	HZRnDi3EaDUC0UNDL0U43Vy9B+bPBZ1daMUaFV5qIv8wUUkqEbrfxQj4diTWmWT0
	MUuAZJYbKicQRW5H75fkdEYRluMU74NOoPJInXzFTMiP+A4oDwCagOzYhZtBnBtK
	HlZ6sGzw3tGDukNst8JJDM6536f4737iW1QpyALaV2nxdYeGRg7nITkgTy9GPoQ0
	oMxUOin9VqPkG0BdbVK38QxroFI1De/Fh/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290tn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2b3cd4d00so5248431cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 03:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755856850; x=1756461650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiZ7xasJHYty7KtFQNXG24FyU2/Y4YICeikS15YW1Ns=;
        b=ixkbhzPtBPUOuNJ5oPlHQFRssXU1vGJMrHC4xxbWKEvFc4EXsWZO7KzTp01JtfkC8V
         U2SUqX16TapJtX/X+QwoFdw+RvK5Dkc9v7tVoKjFRxar1QlCuUPwUXsyglgRSGjR6Lfb
         IMgUvOtD/QQPtehQcUJz5alNxpnpZwfGjYZC6PSbq4RX5VUqjn8nRpICosL5GAjb+26/
         4lme2zZ8hWcibsG6u3GNOIg8muEelX2Ya4A70T2zHj7M1so/4tt7GvzCpSw07Kbh09X+
         DZix/kBdzRv5cZHsuAhOXGLBJLVYcNRLZyZTdm/mQoHBeSh+HXquMBnapphWdzcpidbq
         J2rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRfTan9Tm9kNVKMJrBZk0GXskNxbhenGDn/XXrSdrDwfG3rB68rIQYD2sQdrLbdjdYZTOqIVlMQQZbYw91hlUb@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4hazy7Grxq0WXLwYFwaL9sQjhBWwzdBFTIuhNopITIrzOWYB
	Qn1tmXDrlZWcxmO+l+HidWnq5uB1scLaSx8v9NWykjVo7I7eegiBbIJiLA35vnjLFM59tFVAzfh
	a+nMq5l1UD96ugEZxl+kSPrVDTyEXD1noaH5LXDBGM8Vapwkvpy5mbcBYNTh63kMC0pj2nUjy
X-Gm-Gg: ASbGncvNGBrbrtvKbNziYbdMLY7tRJLcvvOyuYJKECVnDiILBFDgTSLIBXBzS8VQ8BU
	JP79ZNaP7sPeC14fuV3VhXp3fMMtHZhO760Yf24cKNpuGpOWbmhiFpghJvb0eLo/nzb1NFLSjNe
	OYh5DIDU4EwZnr81pA5sf4z5NGahOt7DeVbsXIdCEOXgRtbZ/7A6oeI+G07gwnUm9V4WICMZEQM
	QU7BpEmnpDgBi5pahLeRMcNbpeVrgE+j2WWvEccuB9Gl2DaGJ0Cw625CbUJBiMYtiYgl9CCWk7m
	bVvSwfBttCAUfnis5GaPaqMeH1+Lc4MUyaBiCxr91D2FTF6GvLReZQ==
X-Received: by 2002:a05:622a:15c1:b0:4b0:7575:7de9 with SMTP id d75a77b69052e-4b2aaa8127fmr25925451cf.29.1755856850143;
        Fri, 22 Aug 2025 03:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHlmImglh7kCWwqglLr0kKxfa+uA2dLapDHNyAD+y71j9BoiZKNNUVT2fntTr5vj1sI7+2Jw==
X-Received: by 2002:a05:622a:15c1:b0:4b0:7575:7de9 with SMTP id d75a77b69052e-4b2aaa8127fmr25924861cf.29.1755856849508;
        Fri, 22 Aug 2025 03:00:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0748797a1sm14184608f8f.5.2025.08.22.03.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:00:48 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org, srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] rpmsg: glink_native: fix leak and cleanup
Date: Fri, 22 Aug 2025 11:00:41 +0100
Message-ID: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a83fd3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nIwsDuCTDOBSikEnyD4A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: tLiG5Ko6N8-4FDfsePR-RGurpPVsig1t
X-Proofpoint-ORIG-GUID: tLiG5Ko6N8-4FDfsePR-RGurpPVsig1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/59nZHzagGeU
 3tqNwuDoGn7V7SWFcRF6ofsUoa+yNqlCuYeOk8FPUS/d0sQytnM+J0Nu+DnhTteP8nw2C6Njd3u
 J1B/WDyflMaka9ZizDqvF3F2aG2leqZMXEKmpCeuIfik5hRckUBXZgGQacI8vLx6Ej5iHg+gSao
 DYyOrp/TwSDgsU/pzKverP85STp0JnZ3xK6lgJ6GjFuF0U0pFa1jhp/lXY1i/DYhDC4Cr3byNjr
 4lin64dvaJayGOaWOOta+m7lKC8+IUpEwdUKbFMy6m1hlSRggt8aERdc0uWAaUpZubZ74qDDIhS
 ODScuRuutaxMXaKPFbOwkQ8+zFKg9XM/ngjWIILkmoCKBsy2Iq/3A/gqYW1+oLgxDMcbcg2yQey
 w4NoWr6uWgWtQaMg+jpmgR2kur+RzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This series fixes a rpmsg_device leak in glink_native, and also adds
helper function to remove some code duplication.

Am not 100% sure if this behaviour was intentional and not allow
rpmsg-char interface to work from glink_native, but by the looks
of the code it looks buggy, which is why am sending this series for
discussion.

Srinivas Kandagatla (2):
  rpmsg: glink_native: fix rpmsg device leak
  rpmsg: glink_native: remove duplicate code for rpmsg device remove

 drivers/rpmsg/qcom_glink_native.c | 35 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 19 deletions(-)

-- 
2.50.0

