Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6C3FBEC9
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587144; cv=none; b=hR5C+vgOL4xhR6KrnsTf1OutLDUZeOQ5D/N4lPI7pUWwht4Q0xFRPQvHK/rTkQ3Ha8iD0XzFoKhEhdMe7MftIB0k2t5Er/2FLgbjWJLPnCwoXk9staUjVK+nmX4o3jUPON+1Ay85muhFHUTzs4eNYLEM28pFjMYMLCIlIS10QY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587144; c=relaxed/simple;
	bh=CEzdu4hjCxN900cClvyfjf2+rQRO/dcw4HTOGkcHk/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0YQzUHULOvwRl1XS19aXA6Xpp+5GGLFzy+0x/0EKQHWW82EGFQylmDK6rFrxsgapVVG1tUlb7fZG979ZuQKlgKJJzgmYAUSx92rb5GDHjDh2lpvaYxH92OvFJdDSHszIKhIBrCY12uKMDUJlIMlHi47S5/nlI/xjwXHaUCkeeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2eC1kdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLZR+Hjp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2eC1kdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLZR+Hjp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960B6F930910
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 08:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/
	w0Xh3O18=; b=M2eC1kdVmHYcfwQrMy4CsHCN1RhDZ0ug0JVYn6JbknYNm1ViHON
	2JSh1aTN7990OtfdTuq7XBJT7AkOMyKQfmo06MPqIG4CGtsn+gC4I1J0ugHt9fgv
	5HeoANfsZ+Xrk3D3iwy5dSI6BuLuBU46TvBb32QxDBb24KBI9GItQWu6Pb0GJsX+
	KyC5CEu8Gq4IEcWk9V0l+5T0FxzFrAflrnmxtPOdxE0SmpzoCx9qtgDK1CofpGQY
	eQHFBaeQLAxBWBXbFkmJZIgoOGCRXsjAiFa7BizL0gjMIc8aZ3DIKjcdlKua4DSh
	AMARs2jY51Y/Qr53n8rPAt6OR6CNz49kVOA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418h4te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 08:52:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848551b54f5so1296273b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587142; x=1784191942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/w0Xh3O18=;
        b=WLZR+HjpHDrl5ql6YjC7Bn+LHyp6qBAJqNJZGweX1IruTsH87og7qLSwGFll4RpuSP
         PiWJi6l6oo4yPK/BSJu8CToXr98Jw0KWVrGFpXAfsNYNUl6nAKXslUGa+lMClEAFYFuG
         C8V5LPXYriZoxxY/r+e2Bg0w3KgXg0q2o1GT/MGeRVar5UD5eosPcXjhyp7+Zijc2pR9
         wIyuszO9naxTkls1INg1/iCDEoknpQ+vM+10KzhN3dKseROCmNRAOUythgG86wLAGypz
         Isfvf50q7QXx7eBLp2mu9QTH97NDhOKJSQ6nMxdeBwt3tHrwXk8eVkDyg//oEiLR0MjC
         yXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587142; x=1784191942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/w0Xh3O18=;
        b=ZE9f2+YtFvjadFuBmltHTBWmO353vrjVXHkRquv2BEkercufn/COfwnx9q1E7mkabD
         e0OaKlo4LLo517E983fDyuI6+RJdv1PegX1LgHMvyQs1yJoZVvG9zdiY2KL5aHdZ7UzD
         RZB9uDJDTh+nhnDxhLQzU9K3gstOG1ICgg306wFepxnkkxwcIDVz64tiGEHT/jEIHL5N
         sE8XT9gNh+Mln6MslEgY9YqzCtmcf+EC0oUob7z16gGjvkU44NL2zh9D6xjNtNlGjHFp
         fGVYE5a9ndDEvqoroBqZRkKQB1rJGDhCVlJQdK6z/36oBphMQRDEoDh3e86Rp6Fesdbl
         coBw==
X-Forwarded-Encrypted: i=1; AHgh+Rrl8V/EMHdvwWsoyWgbBkvJjbwgYSf8UnNA79bsMYxhyK+8A+gXTDYDirlHsw+uLr1UkB1GvaDiRy5j06kXfgZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvOcRoFe/5gweDhtkmP7VX9knYpxWge7TcZyKUQCoUy4V15XR
	yJGEdSTvG9vBdtXAGUsP1tsAhaWt53W+38N24oeiBRE5Jy6Xoru8kKtn241s2bP9/Z3/cuREn0l
	IKuTO3EasAqYKAxtQ/8eFYfQDsidihYjX+jJ8f74Oha70Fau2ycJ336ebmiArp1l7Nx4mUSZH
X-Gm-Gg: AfdE7cmLHDW51T5L6qpChh/tIZbZmYDEI+ZHDBr31zVapXq1GgA3DRq0mNITzSoyFXE
	U7aLyDHJpVKyUKScA7DWxC7Zq4fmqTBFJaUcA8ZSMEZG5phyJANb/yjV6Z73XW7D3qg/BC7ikXb
	pbDvu8G4NANSRNFPTJ266WB25BjMoF0KD3UrNthzKzvwd4twJTL2s9nmyuCvgeGe5COOb/WZ0KF
	8E87/FfKvbQjAQgbulA9kTsCYvWbgzJJH+gnIwqcalyQk9bb9s2X1I38/hlAaIVOHMBPZ3PMk94
	tIrPC0bhmEZOiQ3Reb1uifHEpjjk1WDPdyHkz8gUtVk75n8K8OaeNjy7lgAns6WGQJ1Gg71Azct
	R10cck07nqo1g+YjKTCYbSBjbQTcP9y+kmesX7RaF+MXUds/xNoGWZ3y3XeVVai6wOf+jdN0=
X-Received: by 2002:a05:6a00:170c:b0:847:83bb:9b94 with SMTP id d2e1a72fcca58-84843424973mr5718333b3a.48.1783587141612;
        Thu, 09 Jul 2026 01:52:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:847:83bb:9b94 with SMTP id d2e1a72fcca58-84843424973mr5718311b3a.48.1783587141169;
        Thu, 09 Jul 2026 01:52:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] Add ADSP support for Nord SoC
Date: Thu,  9 Jul 2026 16:51:46 +0800
Message-ID: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f6146 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=H-xtdE_VxQG5-1k7KcYA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX+cIa9AkgyMf7
 ZOjCMn0F47u6dbbUw7ig73sm38ia4qbWoqXb2dBUaHXDsKdj0EXYX3ErUx8C4gIu6WtBX5uOszR
 mdQ8QQwCrScqb63RzQ7lvIc/unVOP1RLDnDjyuOSCY6m1HNL3S5t/Qs7zVKEh03C0R9KSj5Yt9W
 q1HC4s5g4KaTmpNCgdN0MVE1yrLfhioheKbwHWZ+ihnvE2OnSXVGRQOkpaXZFbS4prN5GvkVuTO
 lVtH/V9SJDAhq+tbTiL2YfvKBBNPkB+4mambrYppujAA98qlNAtpKw8ikeb5F1burrMws12joch
 g4WEY6Gi8Iox7j5V/VRdEV2HSxE4dFmx4MHWDIbFYf/sTcmfAq9Gx3emDM1Sx8mSsN1fL2ehSFq
 WH96itOve8pplQTRCyRWyybO5y7+gyG38eHqNh6OrPcW8Gd7/lqVsTE4mBVdDIo9i2PhEm7p0qp
 VKRNQFOiZFEk6UQ+olg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX0HiJfhvS9ukU
 qPDiBX1v5TfTr7SxD9+kDNTicsBffAIDtYmZHzYcpKZSslt6ZMVzXunuANj3v1AK+yOPECWZ/1r
 62LzeSnMBGM+12dMwL2aHAeJKm71vuU=
X-Proofpoint-GUID: bqZf42x03H-tH24zMI4mT5UI90UYC_oL
X-Proofpoint-ORIG-GUID: bqZf42x03H-tH24zMI4mT5UI90UYC_oL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083

The series documents AOSS side channel and adds ADSP (HPASS DSP)
remoteproc support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,sm8550-pas: Document Nord ADSP
  remoteproc: qcom: pas: Add Nord ADSP support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 19 ++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 22 +++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
2.43.0

