Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED13D966A
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369710; cv=none; b=f5hRlw4Ga5J/VvbRxK+80xJgRIlm6PcPWcg73g+PgwaUYxhTxOvOaBjSdSj0rDy6PDgvz7jc1Dl3xMByHsXd7KeAtqmO8p2oaufT15cGb//eDpOr3wh++XJ4U0ZlIi3gwMIuCcpS7423FoXtMK/WryuTgw7b4ljI8z4lD+4HX1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369710; c=relaxed/simple;
	bh=+vNXN873XOakefQbWqH8n9IChdpk5Rk+tlb0lt0sTAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FGt33CxaRzamen7+nVm27dp9y3TxLPAESQuzg5us1t3reAl7BLp5Eep55MTjafVMQJJfoT5AL1RlFQ3XgZdTImSj3/2y1pReLg6vBbIU/nBUI1JLAXfLkZv/B+zjLTw3qPJMDHJGrI4EAv+/BCmv+F4drnZG6kyofX/ad9q3jFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtACG+hQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iz6pjnWQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtACG+hQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iz6pjnWQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99jnC3343452
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 13:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hYbj4ynBne3MplkmrjvHug
	K1R01YSntuLsXM7CFi3k8=; b=gtACG+hQSdapdJSew+jb18n+AnfL3+AKduEXBJ
	87s970QuJSje5cj+KSdqZJxt3MmjzMN5D8lp/6QRJHccxqLUxGDllijYDOAhZ8nU
	WJfFULvwisAS23CS4x9a8p7B+a6vxH1CfuR+w9lQFpyUuVZ0eq3z7iI2QSr0lzNW
	Nj+lJ9FOJgzsrmFDiA1K551Nd7e8bAcOq4BzcpyRgpBm5LFG+JYIQg3K/7uZ6gCd
	i01bZfl3d2Diwg1uMKaTT5buRh6AymnxvH1vDEbDTfdnJIpbUR9R8W+WA2h6qXbg
	9EM0IhinrPOV5nI6pVvsCd55BFf7KfQgnz/ee3pMPavMNG4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahsfja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 13:21:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso12842966a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369707; x=1779974507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYbj4ynBne3MplkmrjvHugK1R01YSntuLsXM7CFi3k8=;
        b=iz6pjnWQ8EWhFLkX2kQ8nchfSpA1GVIdn3tg3nI76LvaPhH+upv4mZW8vuGuvTJAP7
         GgCfKHmRXjg0l/ceQhw6cIBDHYn0zPga+VpEfThmr/wG3Q3csEpf+ht8L8D6GB7K+Cg7
         4NfAjCsx6/r2vNzxOgbeFa6Ag28jVCiD7hHf+M/5Epbc/9MkaTdwSESQuFWSJsl0EqTG
         La2Zb+0R/dAyD26gANlei+WNPD6MhkOGCf7sX7ppmUF4xS9p8GQwARpdDe+XUwVh8rin
         CDOmnH0JKQBLfGSTKhBwDtrjHpkWEqy4/oM/UlpLPUKA/5CiRmEEue+SpeR3rc2ZrLDx
         2dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369707; x=1779974507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYbj4ynBne3MplkmrjvHugK1R01YSntuLsXM7CFi3k8=;
        b=exMf0DkRQqo6PomTy+6lGu46l9cgYCuW5Iv/59mAbIqqeH1UiQ+1OKVHbXw8Pf4N2o
         cSLGJ1sqcAhAubAS9EUDrB/CHgh/uDFGIGNR+3Fn0/tCxKU1ZmgD1KnV4/nC10isgpzh
         x5DndErTx6AkUHXI1ceIUhN5YRs3VnMxB0qFZnoEwVxIa5IOqNowBbKTUGIqgaOVjGFi
         DGL8dgMScZCqyGeiw7oAUZA3mBjKCzKgK37n66IF/8+xm42z4PAMz0EiqPnD3ikGFn9F
         vP/wmJ13aP7WIqGec0RMIfP5rTHkYC4sIojjaw5iNN647RU/VYR0hPlN1W+CvNU5scvF
         a8sw==
X-Forwarded-Encrypted: i=1; AFNElJ/CuVbj7jSRlhey82LktCd8hUsvZmvgY/SuwfO8I1aQggfYKjavTmNKznbXbiTh821wbzokX8Z7cqGFWWNt/Exz@vger.kernel.org
X-Gm-Message-State: AOJu0YxDEtAcsqxPDt/m21odkzHB6qvLzFibZ76jXzZ+EUUINEoADBYK
	5V7eEHKv69xMjkGTcX47Wo/AlmO4G/AT/PjeId2EizIgB8vU0Ggrs4wJZNdJOLD0qOoiIhbtHTa
	LtFpK7vzcpnedwjtUjpO9aLrUMI9h6h0fd5OZIC/uKB7W3eGysbN8OA77LJIJcXHqYLAcnSw4
X-Gm-Gg: Acq92OFYPXKKkRwTqpx8p9zTYmfqfQUItMBLUVDAvWqBlh6ccycAXjZ46i/EMBOedOg
	63kjIui4NAXgXYYe/mnbVh8f8wMciqulQDhJjd+NC5ZB/QUb6Yd8WU/cOGb2gw5KZEfSCBEQHWe
	ww1OdJMeG/JSUwnp0K1N6ZkFMMJEQtK0VRVcn5ROLgMBssZ5p2DV1m5VM/is/Rc8nJgaibg0uP/
	JDZ6gqUDRNK472iI0hAuKzdAJFSv9UX4eTOR23wddhKXrnxt3HhP4X+U6psZp7rThBS+myCZv+R
	bjRHajwypJov2o3dBtMMwSr1jqKymnQjyodY/UL35s+CLW0rASfxbQ3bbD8pq9skc7mJR/lPnn8
	Nnuau9rVdn0dpFVNFix66Fh2b2UPfV8j+rTAA
X-Received: by 2002:a17:90b:380a:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-36a45ca3a75mr2903248a91.22.1779369706695;
        Thu, 21 May 2026 06:21:46 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-36a45ca3a75mr2903196a91.22.1779369705977;
        Thu, 21 May 2026 06:21:45 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3d1e9300sm2927797a91.13.2026.05.21.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:21:45 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v3 0/2] remoteproc: qcom: Add Shikra remoteproc support
Date: Thu, 21 May 2026 18:51:36 +0530
Message-Id: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAGD2oC/23PTQrCMBAF4KuUrE3JT1OsK+8hLkIytUFr2kkbl
 NK7m1YFFTcDb2A+3kwkADoIZJdNBCG64Pw1BbnJiGn09QTU2ZSJYKJkiksaGndGTbFDbyizWip
 lVGnKiqSTDqF2t5U7HFNuXBg83lc98mX7hopvKHLKaKVrCxYAGBN7H0Lej/pifNvmaZDFi+LDE
 OzHEMlQW6kFFFxqqf8Y87MkQj+mV4dX03l+AJqPHtoIAQAA
X-Change-ID: 20260513-shikra-rproc-0da355c56c69
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779369701; l=1730;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+vNXN873XOakefQbWqH8n9IChdpk5Rk+tlb0lt0sTAM=;
 b=PrZjUqcGb04RZeVKwM/sowSNh0kC5IRMBWpWa1zl1uVZOSdqIWs0ZNe8ribw6DUmD6PB0Ctms
 gH4E4VrxujKC5psRsPPssp/vo2auDCAN0GQi2+v/ZTeDn1jpHPrmpBA
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNCBTYWx0ZWRfX5kns8nLlTzMO
 iR1kvbDF1lWm7YgXbrNqF0nqwHTAoBoh2RZ0NldjO9KgJbkYbQpIcguixmlPopasiuXkF+e5hDD
 NPkvJ1zX9vlc7di7lj4l1iRi3QXSTxsEd/3EgZF0E8+rYhuagEMQwOfEovuxJgEU0adMcLhsNo9
 HJ0vTM/8Ll2FSPl0yvK1sJ9Ub/INyiRSYJbnqCNMRxGmHTdq1rj+fbs/5/vD/JRDlXB9m6HTRN2
 bq4rvAostaePIXPMQ5FpdNfVAM4sU4qaBkEzEYlQpheiikBY2n9ygEdqL/6+qxqnXvZk8GjodZi
 qZy/xMYdmor0w2JQPwOTk11fd/N0uFB6pCTx2bxeTqBaGGrTZAD+bbfaTwX8x1WLdKJgYm0l+1n
 qWH3wJR2I+1AABMm46wPQviCOm2XrDGHC7NUEdHCPlPp7+hDbYw6T12BDDje38+2ohlaRy4aiik
 UXmauph0Z8G2QhcrrZQ==
X-Proofpoint-ORIG-GUID: VDhHSGUQrLBY2g5jDbJeHegG91a4tQHD
X-Proofpoint-GUID: VDhHSGUQrLBY2g5jDbJeHegG91a4tQHD
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0f06eb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E_Y9bAwo2dYQWIToq5QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210134

Add Peripheral Authentication Service (PAS) support for the Qualcomm
Shikra SoC. This series introduces the device tree bindings and the
driver resource configurations for the three remoteproc cores present
on Shikra: CDSP, LPAICP and MPSS.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v3:
- Fix dtschema/dtc warnings/errors (Rob's bot)
- Added firmware-name property in example (Krzysztof)
- Added power-domains and power-domains-names to false for
  qcom,shikra-lpaicp-pas (Krzysztof)
- Collected Reviewed-By tag from Dmitry
- Link to v2: https://lore.kernel.org/r/20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com

Changes in v2:
- Add glink-edge, qcom,smem-states and qcom,smem-state-names properties
  in bindings 
- Drop second interconnect path from the example node (sashiko-bot)
- Update auto_boot to true for CDSP resource (Dmitry)
- Drop region_assign_vmid from CDSP and MPSS resources (Dmitry)
- Drop decrypt_shutdown from MPSS resource (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com

---
Bibek Kumar Patro (1):
      remoteproc: qcom: pas: Add Shikra remoteproc support

Komal Bajaj (1):
      dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs

 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 167 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  48 ++++++
 2 files changed, 215 insertions(+)
---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260513-shikra-rproc-0da355c56c69

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

