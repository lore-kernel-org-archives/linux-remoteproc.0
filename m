Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C93DE452
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138395; cv=none; b=HrzSykp8uDAAuIIoAu/KJJkGhqaUze/owLOHb1AtlgQQiibXwbWyPBJ/ZbkzkAwo2nO5DpODFJWmZtwNSL5FZXISkryrzolF+ZZN1RU8tmG1pgIG9v7vEGR0FeHLieK7Z1PNyMDdC9G5JxXuim4PhxAJVxAaj0QBoDW5I+Zzwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138395; c=relaxed/simple;
	bh=MB1vtXUMCpkuRXEQiZFl5phzdKm+C9dUzeZxDQlSm4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZzGMHHHPUuXVmVpFHBKybB0EalD4uNFERE96Xq2AMKW71gvOBlMClZJuClVuTrKk97VJeN5vNF7qOq8Cfj3c/62u4WMI9AX+41BVlIVclZKocARjs9JpIo93hgOoFXeNOuagFApfRNMMUe8mt4UEdy2m2QoTzlc+iCGxRN0qrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFfTClyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O70R5tTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFfTClyx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O70R5tTR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7SOs02532938
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Sua
	xgitg4C4=; b=BFfTClyxbaVOq+Nwq0xCo5LLkasnefwIzwryXfJVqScxbTYbNEG
	ZwZsw5oSTzC7Tx1yVIsi+pB08VnosZ1OfFfE1v9EY2Bm6TyqjvMYa9LWlohPaXST
	1iPatRc+iJhhGT8MIaqG2BngK7FJoAJ+0YXiTV1oQq+LsotO9dqcQ6exsCRcS0ty
	RelEnJHHG6kGJ5S7JH11hJEBfeYbIuBJ3b71hEw8ix/zsXAb0meIJJAENIom7xXs
	icS3EGrxz/GxvvG7V2HzLLIq3u637PhDrFu8ca4o9A/NlC9EYyWCJLeqcpPvBRJ6
	cAcSVW28WYNG69NkD8wkL4NY5AE1B6H6X/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajmv5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so4163838b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138392; x=1785743192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Suaxgitg4C4=;
        b=O70R5tTRZc7/PR9vS2ULtadyMX/NvfE69cRi+3V6w962UWfqVMAZAeAKZl/nsQL87S
         IBG0/JWEQHGNEkta+pCYlppTDKkI0WQz+xin1VEs/JJzdv9udJfk3Ft+Z2ac9CfL/MVg
         q7E/WZB64FzMNGM1WlpIbVc41TLpTNmW8F9dDuz/wXYdqmxQ/JjqM2/PjjZ96Ikh+1vW
         vRU/Yq8bnI0TUxwwF23XZYyXi7dlFUU7sITb5BIMZcMbFWRque4RVAfVrlKhG+PD8q8l
         ggB8shUjECJaBtTSkAuuBUOtVdHz4t9XPjcPOjN34BWhjpVT6B/967iUQpIdPcYWP0hS
         gHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138392; x=1785743192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Suaxgitg4C4=;
        b=kD/8Z7ApFRVLWj/61olNn1ELIoCg20gt3x9DwgIsUbqfCqz6Zu+3jL631qBt6RS/79
         Ip2MlESEuIXTDYw53vAWqfW4Y5uxtk8B1+1IkfeSQbNOxOyQRlzZ6LnwtzseqfeqsMnm
         wAOExc4OumlVfK49w1ecR5zJtnRYbJ9BpC3rOoiOEzvVBTTOPpjU/jzwTyTT4XkqvBAN
         IVybg7vkZN+YhwAGg5r3+xVe0Ee37uagII8MxigH5aiaBge3tr+1K2CLrC54V1Ek3mhY
         pYjjCOYXx/Ms/bdAUIpeuT3ZgRYTv7+ntQnrdAm2y1nhNrnxB8PpQLCC7URVNZxaFSu4
         GUtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb2w1QQ5YT4qniVcHBPUpmsoAn2tOijWvA2xonPCmOkwuiNH6pBzeQwBd1R2M0GS8JfGR4iH6qbBfHO8nMK87v@vger.kernel.org
X-Gm-Message-State: AOJu0YxXGAooRGy44L2JTOH2Ew9aUMguJYBrKLg8tTmqsDprbINZifxU
	6GRkGY/aw0Ybzob9jB3Ro5cZ85hzhzAe2GVmqjUul7273Wur3WWoQ3pvXps2dz2uf4q0i+XATm9
	38Zoj9+VhMJdKhOmFU3nZtqRedmlvTElXjJB/Tejiq10yr62DeDjDt4C9bN1tLPXQYYUcIozF
X-Gm-Gg: AR+sD11a7aW3IabGeyiAdUVgyEfGMwNNCVtKAKKwdiS6WqkeSXXqbVKkunVY8TRhTSz
	TespGyZM+IR8e3+DpdZCJqhYOYnhN38/lbcxAA0vZ1rEGtKj0KadZAphuSPfRj2OxpQTQKBrQ17
	GtNvnJ/ttpnijW8D+EtriiK2zE87gcGSrFj/JCM+vjr5YzPosIy0YH2w1ttqb7zzwKA7FERkL4l
	Ra4VjUm7r5lLaBh3kbbqEya82bmGi8MUfvPhMyGyrrYYTiX5wh0sHYQi4mE+xrlahOBDfNjt70s
	8Cod5MMu30JO0tUuaT7g9jUV7//OymUqeh86yaM/itQx0jX2Zy/414Df6g2DGspQp7u8wXxJJ0t
	uLPvBc//Eim0DNYUh66Vcm//PE52skIVj3epNZFvZGUkADEALxS7UAKBF//Fo
X-Received: by 2002:a05:6a00:4218:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84e5942c19emr6252426b3a.16.1785138391862;
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:4218:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84e5942c19emr6252397b3a.16.1785138391394;
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Add ADSP and CDSP support for Nord SoC
Date: Mon, 27 Jul 2026 15:46:18 +0800
Message-ID: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6NUiQcHt81y2GHIa2sfGMTE5BqGgxHEK
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a670cd8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6NUiQcHt81y2GHIa2sfGMTE5BqGgxHEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfXw5GllIhDPwKZ
 opRvy9M+io7Rly7FTRThz65nWm0CRnhcCqgqeGyCuzosOKKLnLPOlqI7ROvX+hLgiWuwhFqW1rS
 Tqa1UWU/Qw3rQfmG/eZeUHfi7WXBI8LKb7lzCbj5oD+91AzKQLEOMean0m7WQLNMRKuTLulrKny
 FqwF2FgBy0DOX1INbwFRjk3/Kmnfa4wUuc3IiKi25bWjQZu4E36KHgsD2ub5lmHMmoGWFk6UTG4
 XdS8fZDm9WXg7jIf+FJU2mttswDypkZIg8OdLRQOuMu9Irwhj1Pkr+SvNM5o123dB/WHo1i5vVY
 AoWT9K0QCk8p2doq9RITMXf6Opw5+IKmuIcPC2Db/D/y0qjmgiXiC+tcySrvOAle06qcMdtjazC
 ucaxIljGxtUT2x1h1lR7deQbrEc/0XJn0BR4jULbSKXX7hJ+GzM/bk+54FF/myZlX21pULXtNg5
 AJoO5WGpgTU75ByLbaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfXyhhN9joXcAIE
 tdtU3fuhLGGGQDkv3N3HHEWw10wn8dqAVnHlJUw35CSxUAWemFqBhp+0UnqAUe3jbyWRi532IVP
 GNpZjUPOHssqTakWJtC6/B9+bWiKAHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270076

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v3:
- Fix qcom,nord-pas bindings to define "minItems: 3" for CDSPs with
  an else clause
- Link to v2: https://lore.kernel.org/all/20260724103848.233804-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Create a new qcom,nord-pas.yaml to cover Nord ADSP and CDSP
- Include CDSPs support into the series
- Link to v1: https://lore.kernel.org/all/20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com/


Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
  remoteproc: qcom: pas: Add Nord ADSP and CDSP support

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 110 +++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

-- 
2.43.0

