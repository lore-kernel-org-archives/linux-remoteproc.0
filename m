Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B8F33F582
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628340; cv=none; b=Y87BIv2LTP37F07X6+lY4JHeGO3TG28YIY/BtC4hpX9B+duh9krllL4IZBL7OcpzD63DGyj72R/xfS9Fcy5xwN5AHwvwn32dj3fAZsqZwbrliPhKIP56w3zzX1Zk5aZzA+B1iyR3nr+EHVV/RLbACLwChowJ39ZxHSHnwJ1dUIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628340; c=relaxed/simple;
	bh=mDOKiKjD0SsH0fUKrRzpofcnlxKOQKAEDUyFaKqfPq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=umDReLDExdaL5/7dl8YjlnHUFodhTOe1fNFKLKdjXl5SM7iWAA88nKVef2WwTytSNllxutAhohg9C0/ShbtE7QBNLdUQHnOwbxXdRehQNUvVr7qCcxr3tO47RYXUpGy/1pE55D4qH6hwvAIUpSC+kqXQwbtKmg2jGK++AxfM/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N61XqqyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BD3qXeen; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N61XqqyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BD3qXeen"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhC8P3084532
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+54wPLDvzjcJ7ZhEYij8uY
	aNhbtItXghLTwIlPdmdtg=; b=N61XqqyIMvIZj7J7X8/2egD/wlNrgl2fvDMlHp
	rKpXFYGNweCEofZ6vWcxg5/EUCnDA/yK1sPeA5aB/TCH+tPpe/9ptANisAfCtVW9
	engLUJl1P4NH68QFJ8DSzVzaVDuqiADAA6/OsRXId2QEPqo6Bzh7r1meFsdP9KHs
	enEkyI/1dNt/Xct/i6jkyjtkJPj94mYLy0CoCqH+i0aCZDoifQ0YCLWrxbC37jrC
	/i/1/iZahRNBen3dR4AY2/t6z32xuljm1PQxMYEK2vAWZvAtAl0w8hxSpqdu0BMH
	R/MXts2+Mk7NYzyGyp1v83MNd1ZC0CTY4eoFzFnr321LMrHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn123fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so49670991cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628338; x=1775233138; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+54wPLDvzjcJ7ZhEYij8uYaNhbtItXghLTwIlPdmdtg=;
        b=BD3qXeenMhl/WoUzY698yNWuFgvqStxt0NS07ejPNou7XmUL/Yn1+VcbxRhUtTKmJL
         w8hXc1BIWzF7+8aw4/08Bgqnifu5byFWTNYch1oM0PMLfWG8qnyT4x6lU2f+Rdfg+G6+
         quaiIbvpuofJ16c7INHyZGlx6ADjbiOaezGePvSelL263yW3ph5lWM0fOqCsXdVXwizd
         zIbfhFMXLsfk/xDVEIRGi+U6kUUO2GO6rGWIbnLL2/Yd5IYnJDQYp2PAtxqjogflNqBU
         hSZd1HiNAHqDGkxYtOmXheGOX3jJzBolJrtVcms7t6HXPSGOmxexcv8MoaCmjfgKNQhW
         oWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628338; x=1775233138;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+54wPLDvzjcJ7ZhEYij8uYaNhbtItXghLTwIlPdmdtg=;
        b=SqFzOnLvpOz6aPKAUoZSieZdKBpwLy9POfPxHAGB3XW3KyfqMy1ka2RJyKh2dBwQSX
         ANHrAXbTFxg59Ktwd+HypB9FTrSZHeBtww8GwoXKLyvn2nhZxSqWn6g8m2jWsuZShLWK
         +FYQlattl/chD7Cs7mhTZga7RWd8FaG+2ShmEN9mpn1gnnKYWqjNytIE+/EzxvQq518Z
         SMPEEIk08uX9PzIML2734kU/xmCE0nRKNfPtkNx+kQDzwebmCOWzE/yKqocKPVP6t/gf
         HSj/5yP3mZn0wAL3bgtFEnR/xXms8qsi0qv/ciQQ5kqAMJzMMwnoC8gA6E4noBRZjeha
         K67g==
X-Forwarded-Encrypted: i=1; AJvYcCURvUIAXts6ugLmL8RhKnWfKap3x2ik9n/saZM4qu3uLV9zR0SS58jdkB+bPD/mnixuL/ygoIBl3HLLqM18ETGk@vger.kernel.org
X-Gm-Message-State: AOJu0YygTPxiP3CYPuFrLPIekj2veIsMsRARs38GJwKOF/e56QZbNRrZ
	m33V9iWkQYLBmTzlcP6Cxcs9ab4l+tcrkQHeDt9/70J1XzjEEgMgoMCPxrED/pp607uVkNE6Ugb
	SW0mkVwgUwbA+X4AHaufaYrVIfPwvrvJaxLa4xf+IEJR6tZrd/Qg0euqaRsNk+vzU2jIgg1oT
X-Gm-Gg: ATEYQzzdEv2iSLsRnpxA2iOHBhqzQwOgWQ7JhdzEA7BlA9wC3mqfctI0b1oBhfdsubr
	+58jkdNSUl4JcEsk1iJuVNGIGUpLHR1vOSVaxgTCpjl6Q+IzK2G/7wR9d9cwi89m16lVCgyv58E
	+fr/ToiA2uKCe7aciTzYDweoOGFVxaXny5r7fOJv9wt3jWbwhSR1tSAG8d3zqKZz6t5Lto0K6Rk
	LxHjhSejpKTUzZgvUVICniIQfNu/M3G/6vUlI6FSMjPuERr3znVPb58bNmMIysSk8th1h+rQAiP
	9Xcr4B8KnulTu/NG1aZxKU7vbn/U935lM98/68L7TE2/pphoYYAwE4qaW+dT4Kzsi/lc4iiMznq
	a0lEy4L4zQPlr0gIt8mnLM3Wl/48=
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr69761231cf.26.1774628337628;
        Fri, 27 Mar 2026 09:18:57 -0700 (PDT)
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr69756991cf.26.1774628332408;
        Fri, 27 Mar 2026 09:18:52 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: pas: Add supoport for Eliza ADSP
Date: Fri, 27 Mar 2026 18:18:37 +0200
Message-Id: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2txmkC/yXMywrCMBBG4Vcps3agjWLAVxEXufzVEW3CTBWx9
 N2NuvwW5yxkUIHRoVtI8RSTMjUMm47SJUxnsORmcr3b91vnGTd5B1bcy4yqJXHIVnkMPseY/JD
 9jlpbFaO8ft/j6W97xCvS/J3Run4ATkLTFnkAAAA=
X-Change-ID: 20260327-eliza-remoteproc-adsp-fa7dbbc71d74
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mDOKiKjD0SsH0fUKrRzpofcnlxKOQKAEDUyFaKqfPq4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3fzc4O8uQ/HkjYu6bMYG5dRmE4is/O3JjAf
 68h2PL2ATiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat3wAKCRAbX0TJAJUV
 VpD1D/4350o4dqP/nB4w32wZ1ElcbMBJvtCO0JOgEKEUzNXX3XtbXw6y3zOUlOKrDRMghdHR5/f
 +TICk+eU2cp/fkV0XPsbhIqKCZYIlxr7laYpkNWnQLuHY40gNA43EvdQd76qLwtzLgs5L+XKSvN
 /HLLsXaU9XG+eOvoBM+GY0wRmZ9ombMJgvKSnWRaEl3BDQH+5a9IDmausmtH4YWIB2BzjjyRZvo
 3ObN4MlrpvNr4XSB1jWlaWo+GBsPGyJK/zubb1EJmk0eU2NeDjvdkgtmY3pd0rQc5tuQCcm8oHY
 VIIlRRKEqEzXjletULVDlzhoNPsdBKozcyrPYsu7kO0kSI7ykvr0Dvig8ThwfxaCIZsxMVER7Mb
 7hRXm052MEpL+InBONqAEHBtcmrZpcFgH5o+n8u1Go1BH5lRj51OeZzRrh6KJupkWeKVqOvtbRz
 Kt5QjaffbcAGDbA6ChAWLnK0vSvXyKotEICR/4x1a/Tf01XxqnXba+/qecE4JYYciWnMQPg2Mob
 at1mVXEbwOvoU0JVRF4CyBz/vd26PqKNYjdEeKi8++l83BFRIZQwYwxuhPu4lz84STlsocHdOQP
 GJtp3HOiYI24P6GgwORIvLbHnmHXq88mMhFSlqBPzwCorWEVwqWDpVW1JDoXy3FyjIWBjSeBxjY
 xPa8J8TujZ1cOqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX8ePXclFDQM+1
 1vkoiTd1lBtUM+MX3kvGL8g8LA7UyPvrb7grwB1Y+gs8HJunXhM5eGzSIyP6uixzjxnNY0NcQLr
 gZR25rXJpXtyeLVSqXbHGgyuvOG2wntTHyvXbCt0BDfJDeeFcoC63H6DbIuc76n1204PN+N96My
 v/v93/6i3Mdmd1kXAwMrr0Xvntm6+J7SBIVfj66CC6ckHPu2Dgcq+WhsSwKCJdXDTZMGOIlX/lG
 6wXtaU446ytz+h5xzEnInVU2pnFJQsqAcGQcRQUPxpoAxzpeuWdLP6qmfjlnANeF2cA54TNx1ha
 YJ80X0vJcuR0H4hUgeVW7X+6daxwkwHVKbd2JYrG7H5b8uNHrKzIxj/EVLxyTbwF+rEXUbfunhR
 MjTQGo1Q4zWMBHmiEGfX3k+u3MAuIP1TwBYkrtYX5U2YQT+PRDj5iN+w9FJIupxIlfB1q77+PtM
 h9wVIFqxtZ8kF987DaQ==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6adf2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_2eu1SGtFr4sOAyhaxkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pWMcFpsg5kzLWTU9X_KjRTYQFSIHVtib
X-Proofpoint-GUID: pWMcFpsg5kzLWTU9X_KjRTYQFSIHVtib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

Add support for ADSP remoteproc found on Qualcomm Eliza SoC.
The rest of the remoteprocs will come later.

Instead of adding a dedicated bindings schema, just reuse the Milos one
as bindings are exactly the same.

Then, just add the compatible and reuse the SM8550 configuration in the
driver.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP
      remoteproc: qcom: pas: Add Eliza ADSP support

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml | 3 +++
 drivers/remoteproc/qcom_q6v5_pas.c                               | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-remoteproc-adsp-fa7dbbc71d74

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

