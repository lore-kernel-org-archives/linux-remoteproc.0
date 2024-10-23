Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE61D2207
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 17:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704293; cv=none; b=ZygG9tcVlBAQDm3+aYwrAtr0eO4dfm7jarxYqj5PY9KM+LVId3gswd6I0GOm676LNuSC26P7TmC8Pnk0lb35HDgcHkQxY/6Im9DFsORdzymYKIuYafS9H1BL790s/GjF9GabDbGOTKaoBcmy2GleIBi5tok9E8+ahpLMwBxTERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704293; c=relaxed/simple;
	bh=U4v5Y/G7x8rAFbNJdXFka7Vj359od3X3yavnuk1vbiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fIGvXfCF/IpWVKEtnZSRWE9IRvE9yaleJ496uiG72twcQux282hsmflpTuQmC7KS99dcIgqCRB9R3XxMES6cQ0A6Hd1MFHSHeRHBlDlrCCQY/ZS6IoJ2myskb1o5jekwLkoQTx//E3rASzwjmLr5kOWYNAy/uAjUcmoUyX20taA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBveir08; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBveir08"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9kFxP025869
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 17:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mno9KrzQKJKTjIihjuqQ9Y
	ntwHWD60qm3mU9BGPN5nQ=; b=mBveir08nW2gZclb/wkWGvXsrtgfwsWGtlli2D
	LOBxp58qE3gnZU7GdJf7u/DTONPGemhxp+itYUqNLhid+ynNAYe1i3sYKagZlOrp
	7n5/7LyS1tmeP6EE6SF35n/MpseD2+z6xqxfs7OeVKnvSuO7XWshJpTp9L4MnfCZ
	lU7ya0nuNI6fHV8dgh1PPk11n9GZ/JozF3O9O5wF+DjP+2yYI3CcR6lTnH6T60c/
	PT+cKvEhTVm+SjNQw04Izm3d12LnNUEomv3Lt0tvgp5L0jCEzKpLg2JUHJ2lTZjN
	Mn2SCPnPCpE5x4R3EjIA3OV5EFidm6FECrrirFhzbG/pQghw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wjxt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 17:24:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-20e5ab8e022so64432535ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 10:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704289; x=1730309089;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mno9KrzQKJKTjIihjuqQ9YntwHWD60qm3mU9BGPN5nQ=;
        b=COezxsPTrWymSwA634DLkNnIYumSkEBSJrgNQwYeI0lkZKwe1iGa2WQJc7WQsBrvpo
         83B8+/pICKXL5Gmgq0Oh3RNJpd3C4G4zYh7qn+rgqIiPpFQ8GNjY/nZkL7HKFXnqkjCB
         bkqgWeH4MPa4i5yAMuSo6mQecAxhPpcLsHZiYhA8+P7KUTt4SU9UGAvdY9M9HpBunrWB
         i/u4450KPMR9LAj+ya65DD0xFSKUAI6xFfL2RamsHFMWNSow3LriHIZ358gSOxJbaqWR
         KHL86S765QHixKCJC01B5AgzjX4+QKCZh3py+dY9TJ2SN8c0RMj8G3enWe8yshmWMqc8
         3pgw==
X-Forwarded-Encrypted: i=1; AJvYcCXzadh0DfLzOCjC6MIDFbUy6jxrMHSngDm+Yn9E3gz4doMS2LYnVVQuoyHmquj+O/9QC41q3VJx8/mRIZDmA09z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jomnc479IptwkmCfEWJD5dZ6TTxjepG5XrMQecAj7QGkIM70
	wWsY1/8BlbbCXBkU4jz5k6fmp2lkiWlo6aUEh9IbeYyzlLowuUPYBcSqbiGsaFHayLw65x4ZfO+
	BNmPRi/7Dem61HnX0hPt0BIRx6LHO0ECUiTG+fhoznVzP2OcZWvDqtG5h3CqPtC++2ztu1/97hx
	PV
X-Received: by 2002:a17:902:ebc6:b0:20c:bf43:938e with SMTP id d9443c01a7336-20fa9e48c13mr44517005ad.15.1729704289358;
        Wed, 23 Oct 2024 10:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOb7RH4mVCzd3hO5LGTdD/S5DYEO8ShwtyV7Pt4jYRt2MyKdq+jWfXwYzzIyvy187RIklQgw==
X-Received: by 2002:a17:902:ebc6:b0:20c:bf43:938e with SMTP id d9443c01a7336-20fa9e48c13mr44516785ad.15.1729704289051;
        Wed, 23 Oct 2024 10:24:49 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f20aesm59525435ad.246.2024.10.23.10.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:24:48 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soc: qcom: pmic_glink: Resolve failures to bring up
 pmic_glink
Date: Wed, 23 Oct 2024 17:24:31 +0000
Message-Id: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8xGWcC/4WNQQ6CMBBFr0JmbUkpqNSV9zAsmmGAiaXFVomG9
 O5WLuDmJ+8n//0NIgWmCJdig0ArR/YugzoUgJNxIwnuM4OSqqmkUmKZGcVo2d0FoXFI1lIv+lZ
 ro9HI+thC3i6BBn7v3luXeeL49OGz36zVr/1nXCshhSZ1GvDckDT11cdYPl7Gop/nMgd0KaUvx
 zArfMEAAAA=
X-Change-ID: 20241022-pmic-glink-ecancelled-d899a9ca0358
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729704288; l=1360;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=U4v5Y/G7x8rAFbNJdXFka7Vj359od3X3yavnuk1vbiw=;
 b=GJDBjnlTINnOBoJT/HKq4YIR9JqusN4gChA8GeKG19LwHO2qPvjwTGdF670QW+HnZEBwge2DJ
 TJ+VDZ9ls94Asggf33Mr3OcvNXkSm4o7mVU3wMk9vzU4hR2l4b6NRJ9
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-GUID: UIMs5S86fB8MkkyhBkbHNtTtzLTEt7GH
X-Proofpoint-ORIG-GUID: UIMs5S86fB8MkkyhBkbHNtTtzLTEt7GH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230109

With the transition of pd-mapper into the kernel, the timing was altered
such that on some targets the initial rpmsg_send() requests from
pmic_glink clients would be attempted before the firmware had announced
intents, and the firmware reject intent requests.

Fix this

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Introduced "intents" and fixed a few spelling mistakes in the commit
  message of patch 1
- Cleaned up log snippet in commit message of patch 2, added battery
  manager log
- Changed the arbitrary 10 second timeout to 5... Ought to be enough for
  anybody.
- Added a small sleep in the send-loop in patch 2, and by that
  refactored the loop completely.
- Link to v1: https://lore.kernel.org/r/20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com

---
Bjorn Andersson (2):
      rpmsg: glink: Handle rejected intent request better
      soc: qcom: pmic_glink: Handle GLINK intent allocation rejections

 drivers/rpmsg/qcom_glink_native.c | 10 +++++++---
 drivers/soc/qcom/pmic_glink.c     | 25 ++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 6 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241022-pmic-glink-ecancelled-d899a9ca0358

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

