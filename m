Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511A931AF2C
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739088; cv=none; b=NyhRzPX0EaeGo14DLKNymzANO7NaT+u1Llxsd/6Y/o6u70xIdlUv9MwzQjE2dzTTifmBZaYbWzrNLYxt59wNH+ac80TPGah70gKeIByG7Rr+fqtpeqtsOwAtM3Sg7kNNB29oap4FYhapiK/ktnmPb/T99sDpWf2SKhTA+8BQ6d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739088; c=relaxed/simple;
	bh=mBFH8HBfqW22uJUINYJENu8VktqxDzTFaEQMWWeNb7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sJgV6KQUDs5G5P0D5nJ914XShCLB3JiAfsBfK8UzJLXttfM1gAx1YQ2XwZ90NRB92Jj03xc9mg9CR/ikjwR72J9xPn4FEc/8+ZvvuJprUG9Y8nlaEnHCkq7tlNroWAibeyn+6XPCrzvAx4uO3kx2Y7qzelAcb7of6oXMxPQmEYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMAa7bno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMAa7bno"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD4c85027915
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/NakND+TfYX
	aLShyyTMVoDpCY/wzwExv9wBqupV4OwQ=; b=LMAa7bnoQg1w/P1Pw18MSBMN9mc
	AJhL3AsN58DCGER4VlDoLObg0fXayRL1kLzcvWIcHolmEJs/edR2iYgjhK92Jjih
	CDVUlal4/RVxEjofTUSVP3PFuuMFmo+IQ6OdrxaHdyYbVf7eX3XgulT5vKPNKFN7
	vIGjU1s7Od6XlcJje0Zn53cZ5SLur7JaGKehdIXgjagToa9a14YBGrw3b6pGTzLN
	tPKJRVr7Z3bplh6yvt0fVfL9A5rP82xuVn30LZjuYy9CBKBR09SwwaHccyjsQOyF
	nIJ89AjrpTVpnYlebkVVxXCayQ8sU5N6nQW3dDx8OtchErxXB2L5IScXpiw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnws46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b550fab38e9so76826a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 11:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739085; x=1759343885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NakND+TfYXaLShyyTMVoDpCY/wzwExv9wBqupV4OwQ=;
        b=pzFNED3GEYoHoTywylUJIcWse4kBNya4UmIgqSYG/+pxX3HxA25qKg2JGIfPDMz5ky
         AivbwQgYazky07zDHp9egN3aSu6RAeb3DPuOtHXHhVClFjq5iijRiWVL6+4gCtvNEv+Q
         CpiFialoKhOpNlLxHeNdGnUJrDU+3FajuEjA4Us98AkkMqKikUPVoMgxRT1iZOZNDyGW
         nLS+ZCeYZLrJvaUilTz8ZWHYbnn8zNSWtY2TMWng/KN09pnIjfFERJVWjMaTbXB6CaQm
         qUoYzq4OESR9vkvHoFTMYAGmAHdc7XU30LEjRjc1xCXvWvvzZI4s8kTdpzvce2j7OwGK
         23Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUZW5T+jmx6f03rIcZPiLt+5ca9HbMHRD8X+3KBBU7ODNB99WLykrLfW+3Uv7Z7kbfu2jsDxgoelQfBqjzBRpDK@vger.kernel.org
X-Gm-Message-State: AOJu0YwWlHR5AZs0qFjLdB749R+hTbnvCQt6nr2nDqWl4/zwgentFsje
	BYkrgutOweYl5iCzoac2aX+DPWthX9I4zs5G5vA7SplmhoaCLhGE9xfjvhQHugYsA7MAVua+gCT
	hIYjoZpFo7bCy6YfUHeVGQVwP/0fOouNiePJiHlJeLkQAPGVj2hrVAnDh3BoXnsB7Kvc1i9Vv
X-Gm-Gg: ASbGncv/jER4W8z7iZb3xsdD1UKHxAvdmiynubErOoDxqrffvH/u88fEoiRREgC7S5y
	fJSF0R/fmeXnH55x36uQTTWR6IEoUrD89wzwM6V27XXS8CWjN8VX1IpUwaSlpkOOiZKmFhfkOF5
	sI1x/1L3A+Dvz7HKr6MhTFywlJwtouk4XYuD5mcfK/sxT7RK41valxN5/ZOb/BM0VrRjBq/DKdO
	KbFv0YGYFfXjvzJmTdcBLd12T2GSaZODdEniHgqhJF0LxzbdpJDGfojus3XvA4OcIK6rwy1lhvG
	silCqNBCC9mSW99ADBOcYe2gFyctCCb6xmtY17DHyb4dNxDzzQwp0BVkB4WqueNdczbTe6zmd5h
	FTBdu5CiwZug2iqBWEfw2TncighGjKyOiG5JaedOPI3agGkZTWZnERXI=
X-Received: by 2002:a05:6a20:2447:b0:2d9:b2ee:785e with SMTP id adf61e73a8af0-2e7da45fdb7mr675812637.53.1758739084979;
        Wed, 24 Sep 2025 11:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu6mDes8yvj7I+bjPl9snWfmZNJZ0/XQrsak+gbcpzmtWRDO1fd+YneD8ujyEQDYBhSr3haA==
X-Received: by 2002:a05:6a20:2447:b0:2d9:b2ee:785e with SMTP id adf61e73a8af0-2e7da45fdb7mr675786637.53.1758739084602;
        Wed, 24 Sep 2025 11:38:04 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:38:04 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel
Date: Thu, 25 Sep 2025 00:07:24 +0530
Message-Id: <20250924183726.509202-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d43a8e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=44w1v6iwfB5DCniY308A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 0YyInL2xThN_TR1zPg0c0Xewdt7wpCgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX/4H5pLsgpy3s
 qTgQzbVZmn5PITZUcCnHo2po5rMN/EiJXkSUQoFW7dozGrBnILtp1nbcERCNBVUJyGOYgC/iMyC
 GxR3YY7b1VGLyraqJXndHYrzn8bsFc1QejGB6qWSv2b0tTk6jkdxbLSQXpoDg9pfFR3GuaTG5lQ
 xytKtJcGYzd1CoF3be8YR0CdhFqFR65EXmQTkUg0KLsC/b1mMZ+xxyPIrhc/KXor+uwCwZHxPmQ
 5fXCSVgsGgSZjlHxOQloLllsAn6N5snBfLd8VUDayjoUDGn6jPKXi1Mbpcvt6ui1M4lXEbI7z/G
 7LynVqun+VjKdeFYnH3NsGPl2ujyNj9IDaGw2bNix1k/lwEp9Ch2mQ2lkesYEjoquUF+nX+crPx
 6n5I1d0A
X-Proofpoint-GUID: 0YyInL2xThN_TR1zPg0c0Xewdt7wpCgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Document the Always-on Subsystem side channel on the Glymur SoC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 851a1260f8dc..bee107bf7e81 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
-- 
2.34.1

