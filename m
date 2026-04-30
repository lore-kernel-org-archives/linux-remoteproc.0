Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B03A7F69
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542321; cv=none; b=Qj9hyoy+xWGLWxNws+cKh9HlXbDa0BtQTZpfw0uq9Lj2r6bnzAl+u9jYAN+1GAoqNY9//ypsYlz9/5mGVUGbmL5/EYROttTEY21v7MWiOzZxrRy7Xm+yTYnHJpxeBnmvcHsnx/Gy8gq5tHYpqtCG2taZ1JMOvHcDS95HIXHrEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542321; c=relaxed/simple;
	bh=ugyiScs0hYFYLbedzg8P16mV+6LQJr8Rpje0ur3H0Ck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s16v/4J/+yy6VqXs5peUGim1K1dz8LCLasPyYpV0dKAOiS04otKCP5O/gVK51khL9+88T2Wl9Dt+hfsxjMZQJ6Ml/DQHF/6th8t6YvqLl5QFx5/lzR4fRpiImZtVnI4ty6bL0ZInYefcGgV3jLssRKNTgiv9cACthJVs4W+hqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o27+erCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqEFSrbL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o27+erCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqEFSrbL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U753Fg830424
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4TR2hgyAocOg4yzQctMkNu
	sg9NkxK78eVFH3lHgb/5w=; b=o27+erCAndnK2hEKBhLlyBKmatx0d96B24gbjY
	t4/cDO7tBJJ2zx1QbL4Bomv8TYrDeJAJBsIfWfBfubSxsQqasuEej0QQMTeTfIon
	4iyby+xzvMX029c7d9phVB2ZZi26Xbl0J49Ec0u7pt0NCtZmujP0SLAcKQEmdPA/
	TEKxF8GySeknQnzAwMzyDnE8HpyMae3JKLVfVOUKsPWg9od9ljg5xuIgmLrGP2hR
	UvqihgX7YURwicl3YDjrI6FuK4ed5U1rwLzPeV9mnyO69WdbhvA6qFWtv40SnQ0/
	/DESxDu/WojAY6o8WgxmkeTPoEhP2/Gf77ll18eXzkoz4JUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq0kyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso721390a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 02:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542318; x=1778147118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TR2hgyAocOg4yzQctMkNusg9NkxK78eVFH3lHgb/5w=;
        b=SqEFSrbLuYgd4WoagpYGvU1BhxyxzQ46Tn0NcqFsqrmd2sweRBAeRggQ5sRIa1qcpK
         Zb+NCJ959dgkk2igZ6S21J/vxnykucesQNjaPCYdIpYMgzgsxEZQcZ3uDTgWuRG4w6M3
         pb+we836HEG0zUoh3VNTqgu/i+GHqs4OalCwzXhjXyEcGx0UN+YCgfrjvCmwQDG0zvIG
         EDzcHY2Bntaik9I7gfosHxNndQt3PDDxVL1ALdSh5YaXTGIQcATSVOoayrK2uTmukbcJ
         3+jjPwqUDmbW8jxSLnmZffnLLBktLs1z7hKDXSX/5aQttI5xCydaRZjDhQSOMMUYyvPH
         ABqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542318; x=1778147118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TR2hgyAocOg4yzQctMkNusg9NkxK78eVFH3lHgb/5w=;
        b=fLtDSZED4SevrgaQKXTZY0GwHtjFICeWawTfDvq/7p1qE4JUA7Z7Z0RaM2yjkTPt+j
         2UY8ijLOo5xX1045luL3Hir/U9AuGBiaippWoKTYaklQNLpXcLjbuJ9axPvK5IkxBAJS
         8BAYwxs/nyZ3KfWoffsfGzrJgmai4mueYPQ28er5ffYCdvojurrhap7vmCP/PbbtquTK
         EsAuMpmJu68K+WhLEhhlS/epPOunf1YWf71CDC7xNt5gswzq1Vz/aHM3Lt9D03SZfrR/
         oQsEQDdRP4OkaCmGPdPYf9PC/P4Uop7gONFzth/PQG1HKOoER9d/slWvZ/Nk9QSA7YSa
         P0zQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BU6YJ5/V5jlJ0pG4jJFDz/2jvO50Yqp8u0+3EN2MyFR9Bj+Z12u/WkTGPrdEdsXdiJz6YoVnwBFHhvIPccRD/@vger.kernel.org
X-Gm-Message-State: AOJu0YzAARGNx+K+VXt6X8MeliisdjRtz8S18oxmYQnHB3wA3JQUuDEv
	kuf/RCiKUwo2hpYiK6OI2iIJZD5ZP9WRY43cEqQzq2LtCRz3opbnWntJO/mHK84yJHa5oWTi5Pd
	wq3xA+ySVvkFx5Ha7V+oqYTjCV57AWyiy/UYKWL8Vml0XQ82h2TiJHcvYE3xn/+WFTY/z+tN3
X-Gm-Gg: AeBDievMxZjc1qSW9hW2Nb8NJXClRf55wklsie2uZ9ZrPrw/houevgVt55SaLWoNmnH
	J72lCzn0jqJiVGC6N8Q1ffJ4zrcnNAhelAmMlSg6XYKrAfIabv3bBYSg//IZhatoItlvFqarZcL
	uUramdVXiQwlihTBXmKL2vhoPvcmxp6JlsTj04pSxR8zFI+XdUdpcIcZYbdlzBLNnIflvI8WheO
	CXMjJmwGi0NogZAO65btgAccs2qwcT1+6zrQ5oGRoINmfXzMjI4Ncefy3CIgHmfF+cYAXDZjB9Y
	TmKQLwSvtTmonvbMfWmom3Js8GPup4TtNHzDmVMhhd22I4x31//cI46pgMO21FPV2/mH/Ua+wCX
	D9+Rkat1TxbNx478HfaJ/NlvM4zXgZz/NJ1vNNHrFPvCHQ3UxdlNk0WG6UHy0+Q==
X-Received: by 2002:a05:6a20:5493:b0:398:7c6b:8615 with SMTP id adf61e73a8af0-3a3cf57529amr2276407637.6.1777542317976;
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:398:7c6b:8615 with SMTP id adf61e73a8af0-3a3cf57529amr2276369637.6.1777542317503;
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/4] Add compatible strings for RPM and mailbox devices for
 Shikra
Date: Thu, 30 Apr 2026 15:14:55 +0530
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgk82kC/yWNQQqDMBAAvyJ7biBGidWvlBJSs9GlGmUXiiD5u
 6EeB4aZEwSZUGCoTmD8kdCWCtSPCsbZpwkVhcJgtLG6bbSSmb7s3epp+WyH8yk43ld3y6JMwC7
 iE3vbRiiRnTHS8R+83jlf4FhfEHAAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1064;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ugyiScs0hYFYLbedzg8P16mV+6LQJr8Rpje0ur3H0Ck=;
 b=bXmnJ9DHIsHnIm26jNvNfk9q947qAJ1hmfMnNurpjTGwu7H0uRkVYrrDJD/2L0pPmUU2bx9W5
 buPJQxyUeGGC12+He8bZLBKSjZomkXxnQThOZAyV3O6kqXD/8SO46yt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: wOkLbX-H26YpNOuBq3y_kKWEdXg_7W4p
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f324af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MCz6-0gsceDSkw-wabkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NSBTYWx0ZWRfXzBvoGu4l9nqK
 r5FuPGm/qQW5CudwNmIYJC/SSFt56djxBV2z0Vn09nuQeCSEtU8XoAfSJUZuSwR3qRHMN4dJFtZ
 rAa3HMC4Y8Bd9YuPvDkcGShKZK8RVCxxfukBX0AcrX/BCRMEnjOvHXcpL+ZI7laUS1dxZNx0WV6
 tHfuY185wuk5Q8IIfFlUC70Km1of0zJe28AufVp3GUJSIYGzNiAlc69tuG74ejvz3egC+SepUvw
 rDQxlT83Q3NN3rm4YnY+zGjpYFBV1ZdpEDm1Zh//PuZLGNBa91PTWeoFuvADQRFepgTw3geODIw
 AiuEvgkfIOnJgqPIpaB67BTQxzYHhT3mdLJnJ+lBMkDYGHnzAfwpnk6pvkDyWh43gApt1lnwJKz
 tIJuuLEXcHot6Y7fEOfj/M/fFmAYjE9Ltu9EG28geaQ7c7K+Per0uwn4045nghZKBwX4kxN6QGi
 gm5motK2T65Q+AePNCw==
X-Proofpoint-ORIG-GUID: wOkLbX-H26YpNOuBq3y_kKWEdXg_7W4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300095

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.
Also add APCS IPC driver support for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

Vishnu Santhosh (1):
      mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                              | 1 +
 4 files changed, 5 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

