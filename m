Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73839021C
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643622; cv=none; b=L4zh1nBQuocGpynceTw/TLwtgWV5cQWkh1zL3LVaHsBUqGYssg3twIr0twnjz35TOMadqvVsbmWdeNni6kX+aLFBU1lCns/yaspI17zB1taSYjXToJ0yEQA8RdvOW7ZSlYBm5rH6n/2cmg8PrUj17ToJjO8roTgnk2Fs/i9aaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643622; c=relaxed/simple;
	bh=63/IlAYS5IxiUoM673sgO/VuUGXKg24DjF92qlI5JlI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uGwff2E97LLp9n/tfLXUl5WngfktXpvS7FfJIPA9UjvjOteTOYwFZ68nVn61vXo60t8BoY4XwxL/B1JHrhr1TgVMtaI+tBQetkVTS0FAIqr2o08KzGFIhCJ9sFzDo4LpXU3NKdzHik4BoZg7cBlzN+z7KkFhCfdpUa6cHjyT++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjGPJqDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqp5x/5h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjGPJqDV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqp5x/5h"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg07b1841250
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7tdRGdzZYzthFsB5c3Rpao
	wsIvHGfSK5OdwBUSgGXrw=; b=SjGPJqDVwFjlo7i7L3tqNa9x1BzA6dWeuvQxcs
	ivOayWqltNHBHEA/RsbO2PApEfeYAATRcmYorPyYWBXDyTLcqn+LX5cEVwWGQ3HS
	lZXQ3MNDnwmvHHhBiKOxVUL/REkEk+R+IjAH2LqyeLI+JDWQAwE2AiQ5hFqJaPx+
	498ByWw3g9V6TKVv8pl9Ns9HxOVcyY+z+ymqQiv88XWBgdScwqzsjQwBOAgNeO82
	AGdsyV03TR1ITbwWRDjaA5+9L+Lz42YyuD2m4pgJjmFWjBsqa/gRXrktbmHK41ms
	dftbVhbr19gHxFTca6MLcstj51MxDJnsM4jSicvlgj/HW5lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2pb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c075c1e25so162505291cf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 07:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643619; x=1785248419; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7tdRGdzZYzthFsB5c3RpaowsIvHGfSK5OdwBUSgGXrw=;
        b=aqp5x/5hoG/ByKrI5FRSGd2FlkyR1pTSvF04SMgsfb/xgX6pq9W+PtjL95Yz2NCFwi
         3HFuCN1PUM3IQTnOPjTZj4d9M9etWTAiR4GdBDJm2cEbTnJAX9dEsgTzj2WyMb0FzlkZ
         T0T2lbjjoa8DjUomRg+/WrudVX9ceDJ54nYSanQqhQYHH9Mr/TVcnAuPzOufvFSZM/J5
         yDNipyJTqxKIowdZfXLvNlfR2HJkbYylCmUKx6294s/6U6WJ9Wlk+GZkg3j51yU/WIgn
         a6EOal9wmBjiRE5iJsdAQaoEd4kgs6apeuESvVqoGdT/hE+kQ9IKrxqLcxL1VqdABgqM
         fweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643619; x=1785248419;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7tdRGdzZYzthFsB5c3RpaowsIvHGfSK5OdwBUSgGXrw=;
        b=gpyfjtK609K21J8UT1z3X+UNEQheaCZOkJ3msSwZ/flz5l7peg1sZTcqWmkM3sOy3v
         uf52SHHG1wLPebDndUrSZZHvOw0sEl3A9OCQNBcc4ouJPciHfgmdC4M2hKDVD+Tf9RPl
         0+WGUxj512QMG4m6J9+eVajB60w/+VY+YO3HJ39FgB9rtoc7ipbLBBDzBW2YW0f7bDMB
         0VEgm2MDOEJON5xnTc7YB3Y81mJrH1qFPdut61cqUtAx04u8k1/rWInIYSA+eSjn0WT6
         iQL44lrqu6gys6K2ix/fXFhod+VcD00a3yrdsZrrm+/Qs39TkPHx0xkKNF1z7+USJ7Dy
         IUkQ==
X-Forwarded-Encrypted: i=1; AHgh+RonZqZG2hVt9cV6FdfpbPsC2qTM6PqeBOA3GB/8H9i5PGZB3M5SgetZ9jPiPnRwvDou0Ki5ke1Q0DT7mfWhUnTM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ujZl8wopexepNyV6MqurtjoKHT2zlSrskJNZ4KCHC34X94eD
	lRBad/JtyOjxb+hk0RlwgNG6r0A/S3lr/2KOztWuXNGnJKcuM1unZeOxmR6vw0egXTsE7FyWRA5
	tm22QVhOtgt8qReDvkH6jNRYG7P1ZKoYnA9bPcaoSBkuVX+k/xnhg7pI0B0zAySdv6ITHYazk
X-Gm-Gg: AfdE7cmjz0PL425EG0r5p5RdxdY9xxdRidpYldhfnjM+d56ZJC7fqSk55N3txNaRwj0
	5Z0ji05uZ/xDE8FZwUwapn08JuXFPmPChrWxoasKinseXuIpneJDlFvCdasARkQcmLLP0V//VgW
	oHVwsKS0rSE04LraTbTRFMGMhtok3dYk7caV1AQOXkVjRHhpeL30yofPpQKlyFlHH1VnfXL46Je
	+/5dHXa4WCcmhFLUWDNIBiOpt7dsasVjutNenV+bFioJ6vOFqVpQWkpDO6ImnyzZYP6HKNsFxWR
	goYIE/r2xENBjwmU/jzElm/wnMG16Lk98nJaxWIHbHQXxz1KnKIojdv/5W7jlURix5qUN8LNAjR
	Af0e99A9E
X-Received: by 2002:a05:622a:4d43:b0:51c:21d1:3862 with SMTP id d75a77b69052e-5213c008228mr177156751cf.8.1784643619162;
        Tue, 21 Jul 2026 07:20:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4d43:b0:51c:21d1:3862 with SMTP id d75a77b69052e-5213c008228mr177150381cf.8.1784643611230;
        Tue, 21 Jul 2026 07:20:11 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653687b2sm84762025e9.1.2026.07.21.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:20:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/2] remoteproc: qcom: pas: Add support for CDSP on
 Eliza SoC
Date: Tue, 21 Jul 2026 17:19:56 +0300
Message-Id: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2AX2oC/3WQy27CMBREfyXyuhf5kWCRVf+jYuHHDbgicWI7E
 S3Kv9cmtGJRNpZGmntmPDcSMTiMpK1uJODiovNDFuKtIuashhOCs1kTTvmeSiYgYO8TjsEbwIv
 7VmBsHIFKSZlWXB+aPcm3Y8DOXe/cj+Om46w/0aQCK46zi8mHr3vwworvN6N+kbEwoCA4aqlYx
 01zePcx7qZZXYzv+11+SIla+BOMs1cwnmGdEHVT0wZrq/6BrVvxgNOcd0nbb4hWEaGYXGqrAa8
 JHlGUPI/WVn8NbIow5YtHfh4GVOmg3WDdcAItJeMquzWnbd7iuK4/y9uyDJgBAAA=
X-Change-ID: 20260713-remoteproc-eliza-cdsp-07701ba2b956
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=63/IlAYS5IxiUoM673sgO/VuUGXKg24DjF92qlI5JlI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX4AVfTkawamM7hVkqTDU7KSqRyhvy0LfRin+G
 Wtnc+iXCv+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal+AFQAKCRAbX0TJAJUV
 Vl1GD/90XLR6EBd517dwCLVClMdKYrkFjV99W2++BvP2V8qlTh/S3pXFL7JdGe/6wVAk3oEtKYa
 tuMSJoaageMKnIb9sZVp/7tNdq+924Gu/ncla0fmaup9YjzqioGFhirO98zoFCLpzIZERwSThIY
 x2rU0TYG9+5sZQNPAG3P8YFZjD5bNtG1MWMA+CJxCJKqWQdwj/3cl+vAxxN0ktVvdqnx8/dQ74y
 nQS0l/LuYsFgnOzUnskmQjfJDYY8MQa7Ysx+X1U1bZHjNN80N9+uQXnO0GPiO6Zs320g5BFQ3rb
 PpJnyNHHw9nJbHJN2FWZMnhKUESepLSLFGT+JUV162ADL94oKnD0v8nUG6QFUPYQsxnT+UUgfbV
 5E+ENOztcU8Er6GgldG/Oba6woYSlj8FFIXHsVGYy+VMnlslLTJk+mdiXdXKqmbrH0TJrPj01OM
 nCm5J6xp6VJba67nzgeRheodB2987RQ3M2kS9f6PFAigemm/i7bi/kq3lBc6tZ0gy70Z8+aTXnt
 CU172PquxvrV1e1k/Gac4k24m68jBvc3n+vGb4JSJaUvFH9dXWBExjmXF/qEY/iQzd/ZI4U2Mtv
 zY4RoCJgHPCe6LN44mAGYW4iVwIadzUEVQWbXKpb+44L+s5Zi+VqROrhoSBs/gBPp+q/lx7Mpq6
 tAN8xbhXIB1gtaQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: wIz7_DFfDs8RXgtDY7BWEWVma-BqZJa-
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f8023 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=UevxoewetnaWWcJ7pQIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX25AdK/iJwCPX
 MokDt1VF7icK8U7+6HNJimyaHjigPT1Uwaec2mUyMK7ModXjUGSCRZt61t3140UW1ShUzkTOw/4
 zhwk3XCqyl64KTu9BXZo6ar3Wb7NKGc=
X-Proofpoint-GUID: wIz7_DFfDs8RXgtDY7BWEWVma-BqZJa-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfXyl+Ea6aoVS+T
 Z80zF6MPXfuEJg0FFMOytOF+FicKU7isNLGW20BKAZv75gEY4klVSaME2IYdRWXrC0BeL3oyiIL
 irpXLV0A+LeHyv9Y9/5LVquhMuqdOwzmwkqDqW28dWi6lUqS+03xCMD81DfFExWwFvzmw54JUGB
 x9npRKderiaXSeUAiLoq/0AZ5KSqKI8ePbqVPOD83NUfAVG6ekBQbGvpQCiAkxACoWa6KKEz5K9
 Mz4t0KePCwmpWKMI0NHYRkv97Q3P3N7rvv7JHEkMUB4j9BkWzUEBHbmF8hRSl885BUAVeNivh3C
 +nScO/cYeZscs4VgL2in9b070wHt5D3nkAYjeAUg6/4L0nhE8hVRNyezDx1M8dNFmTDaQMQKUmL
 xj10RaWEHLUyUzo6V4VCSQcN2ZuczZvr/2CuvCg7sNIpyLZpsBpA9fCwKIfqBeWKGZagTvTtzBU
 unZIU/JJovBOackV+jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210151

Document the compatible in the SM8550 schema and
then add the driver data, tying it to the compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Moved the compatible to sm8550 schema instead of milos.
- Link to v2: https://patch.msgid.link/20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720.
- Picked Konrad's R-b tag for the driver patch.
- Added maxItems constrain for devices with only 2 memory-regions,
  as per sashiko's suggestion.
- Link to v1: https://patch.msgid.link/20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 21 +++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 26 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260713-remoteproc-eliza-cdsp-07701ba2b956
prerequisite-change-id: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20:v1
prerequisite-patch-id: 643935c56d11af806bd61d3c0dff9d534dc9ad73
prerequisite-patch-id: 92fcfeb6789163a3c4ea3e47a787d9808bdf063a

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

