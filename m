Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC93BE651
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512232; cv=none; b=Swa8CCFnglWI+EJZvhu0UZaJs1dw97LS7YucA9H0IqTjCowd7pROtI59R+DY4y5xAtd66uJGdSaMjc5KIctjrAxzZ5cZ4HH8DRyPMi1UMKXy2zqvU0BZqSh8LUiX5nPK2XHDrudZtPUQOFW8nZBCLv5BQ7fCplf42oe47aAQLJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512232; c=relaxed/simple;
	bh=psRo9I9LgYzHuhS0Zxp6rEDZsCh2X6Q72/SFi+8RLY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JwRDNRNEjrkz/5FUlCFVG2EsAk1nIU/XZ4yrIU47PESDYcZFG8LNbtwMhe3NTqJsR6uK6sVCq9Vk8Z3fh9AMMA4qmyEyyuD0lbUGxTH43cNZbL2bFN8y4pTgUSnOrS+M7RnXSB0Wrr2lbneBGNdJe+z2RXbmavtEgmzwSNrjDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr5z36h3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLcNYjwD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr5z36h3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLcNYjwD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6ItW13346549
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 08:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F5N2j98u08uOVXZXP7ZVfr
	yLKThl9JN/WOEyxMeafXk=; b=hr5z36h3E5+yLOhiRUlpcU/3XQUWfGEHZYogG3
	/Wzgnq0J3ntzA8LO2kZbbBTwwJAJ1WAipYkeHN+lcDWuftUfbTmUbLJ4yXOM8VI6
	3V/7pGuWlfwmTRF7nCR9/dcdG6fd+b6+C97olHwRbacrh8oQ+7H/Lzxqqq5NDimu
	WrzbRPUZ8RRBRUv/g0GdKKJdPvq4VmcJEFklLd7Pv8JNu9rs4nPtUFYNw0zfq0Y6
	UwrD2wl5oQ7NE1EKa8qUMTf8jXbX91vDx8OQPhmRnlbASZfeSNkimsaV3l8HEQBf
	hqfWJ59v05mMOexJe2IBIu7zeagXKzZv7kK267iLC7HMjA2A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g86e4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 08:30:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so1416302a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512229; x=1782117029; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5N2j98u08uOVXZXP7ZVfryLKThl9JN/WOEyxMeafXk=;
        b=HLcNYjwDMjuaStaPS6z+JmTdewYv8QLrz+/XtGMjoMewEJe27E0m9dSagfBWKbUl0D
         MsRuSnsU/rzYdtDs8D1bho2bAlXwdE6gu30cj/LLx5fCFhM+6aqyCojLdBxw9xF9RJsO
         vZROYb/abk6/kJ3x2xqGFclYjvB2gV/U04XsKXSEpOk+oy1aemh+oqetSOOmPvEa3+S+
         SoiIUxDTsOinYkvtQijiv7iakH8UpKvKMRyG5TZ6MuuO5EFy8PSwa+DhA8e10wf7F4eb
         1CySDFc5Sscwwo4FK4EtN/z6UM2IaovGYkq5jLBnetmaF9iGxi4jozwgIHGeeDZ/50ha
         egoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512229; x=1782117029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5N2j98u08uOVXZXP7ZVfryLKThl9JN/WOEyxMeafXk=;
        b=oyksbCW/Lny0Za6eiUJtZaV2ifdtdRoPNN69OB2eBLUDwzR/bpmWNQ+apkyQwC3C/2
         Wj/aGvs3NxrO2UqiAHwL2W182hzwru0TdLGQ194L4OU6P25pOTSjGgJaJ6IwQb4UirUc
         dnSqfO5l40OyqMxkO0Rl5j6fMe+wYdGpd/1ApLrE5SM5R06K7UQ+OO0H438jaWXRJ0UI
         Xa4O4O43If46gYeyFiTQd7VYROIBnfWPf1txMwE9Cg55qkFOPohUWXS1M8wBXrVXQ04+
         KL6xnQTD3NmdS6aZMLIqc0AFDI/uiHyjxgwujazghg1vRnA4oPnjOvmzl90m+WtYw8el
         PRhw==
X-Forwarded-Encrypted: i=1; AFNElJ9Y8OU5wa7SERQLio4P1QxEUb2FtQLhKfFAtZ6mLBLZ4z5ZbxSimu+50bqvEDvBaTAPNa114BczFVSpa8HtxitQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZixEpB314HFRKfZUJXJKvVp4mIIHhjjuhODVZTbE4mx1H+2cg
	+XNyT6ETFn8AmbInd+diScGAJi/bReJOh2oUVzH6GmsQq4w8Z5NwHUp9aP5QaM33doXtSPDzV+k
	Gpy154yDjblFjp8skofRCXVuDWC6n2AYuIcIqEOY7fjYGLZB/WoEaq16xpEPQbe/tRjocnhKq
X-Gm-Gg: Acq92OHCW5f5lbtTJpwCoQQORi3uUUcv6Z7r/SXRlxH205Py+JnMwyd0fdmzwCoF3ht
	4HgeRCHLm8YNrogjRTS53LyHoITipS5izBdxoSvOIjm3H5SrHs3MSO5sTraZCP2RZE/WbmOMnAP
	hhL7oJsiQelPizfvYNffturGcOgsVcmXdKYqYw2SeBFp0L4R8oBz/hXPEqBe7aoruVN0WHAhDAj
	A/cGtWrfTbm9vrhRv/Wg0E1yuuD83WWRdAIFW5XIL8Qn/QoHt215eZPMdAbQJzBJIW1qH/hMZAu
	uKQF29Z6P0u/6sdq4dKZmww7im+KF4C4CdvXKtQFAWLrem0zjjvnxA/Wqa3rBOyYoUj3D2qzmL5
	mLuNmCj68t5cYlicwillFs0K+TYS3hoBivAtQQ7P4NLHrkz0l2gtBs1+t1iD0u0KAlaLIPTRERy
	OIbhksi8vZdfBlo+k=
X-Received: by 2002:a05:6a00:22c8:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8434ce42094mr14205003b3a.24.1781512228593;
        Mon, 15 Jun 2026 01:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c8:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8434ce42094mr14204972b3a.24.1781512228128;
        Mon, 15 Jun 2026 01:30:28 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8fc7sm10075239b3a.37.2026.06.15.01.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:30:27 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:30:21 +0800
Subject: [PATCH RESEND] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Qualcomm Maili ADSP and CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512224; l=1901;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=psRo9I9LgYzHuhS0Zxp6rEDZsCh2X6Q72/SFi+8RLY8=;
 b=Rj65ynsu2FRjFpXQRmXgqWXaFD5ifNWAkaYnaY15Ueug8987ZtETacjkAjQ9TLfJHoV3n/baR
 YHGRA0GxedcDF3CJ2tbwfOJgTeiIG4KLnNXKCtBOYlLdhkYVKwWCSqF
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fb825 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NyR1cor_mINAUlzJR3sA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: J85icR-bAB1ZCV3htORbmH5VS6IbkhVx
X-Proofpoint-ORIG-GUID: J85icR-bAB1ZCV3htORbmH5VS6IbkhVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX9NS6fLJeArHj
 ZUfmpDdkY4gvlaeLv7g+GUZh3MbQzuRdS6eMuNzfz7xaAXrJt7YwpwV2FJH15pFokajC6MkqWTU
 XvyV/VXkeXz3eU5fzjxdy1y6Ym8gmWkpRHER3cSqT109HeBCIAhwAEHt27ww0b0bGj3EegZStgJ
 gmFpIETx5XCVooDJyu4rJAG/x2iAAW/KqFCeGSR0HkQtEv7SDj2qCHSDTiD9+OaAz8TY+0WhqS2
 ZD7nRIOFOUuzW8dsX48CtWXqOCbP3GIlUKfgmVzxBAg7DHa77PiWwW5OoMeP9YpBkisuyS+QXQU
 bOlaqhp4ofzmFYMpBBH1MgRV7O0AjMxc5ZHd/jNwL1T6YttKB01WVti59ChT8KguOYkkoHV9K5G
 0hHAr42vZZjXg/agOXjOF5IhJInJBVQB3alGBf8gx6OeuSWjtBaakDOvBtBYsQPvekVbkQQ1rvv
 3skcwD/vqRzeBQvW7HA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX+Md8vo0xeJtc
 h6uCpcKYwSgAVXdW3XC50+ORdXy4YXYucS8kGGmdh17M+JMB0/0nJv9EgfRmxpRpwy/7rmCRKoI
 ap5GNZej/dnwvLGOYrdlL1S4SXuvpKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150088

Document compatible strings for the ADSP and CDSP Peripheral Authentication
Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
SM8550 PAS and can fallback to SM8550 except for one additional interrupt
("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
not managed by the kernel.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..ead7a7d68f59 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -31,12 +31,14 @@ properties:
           - enum:
               - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
+              - qcom,maili-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -106,6 +108,8 @@ allOf:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-adsp-pas
+              - qcom,maili-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-remoteproc-9eca14b9a3ae

Best regards,
--
Yijie Yang <yijie.yang@oss.qualcomm.com>
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>

