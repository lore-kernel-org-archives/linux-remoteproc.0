Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C81315D50
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739081; cv=none; b=P6TkqdNXXMFix/ahHA3Pozax9+70l4OsRiAJwKpomWXXHCmpO/eCZmftP3rTT+Rko4ugl+wek2UQoOXmIEtxrqW3dV/0c/m7T2A6wcyT9U5dcnkX2YBBMoIA9Y23QjUqfMiPffiMN4Eae2J9CjDyDyxjuhktmOHnrD7MSoQdnwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739081; c=relaxed/simple;
	bh=T97FcqFinqlzYxgH+rSC8Mhx5RHcO1oPAjZVAZ06tiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YyT5Kud1BsSyy1DiPsDYTzHBAYY+Xpocm7Dcyx/OQhAcyla4Tyftqam6OT7jcSBsbmm8pDE7aEzGh6MTjNcKQGcTVTeGrd3cTqBONUpMOtFCrHuhP0GkvZD3yla4wxmuwuAFdTY64jmpXqz8h1CEkOLq4y8PIu1GF1MZsWrBc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/88b+Cc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/88b+Cc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCwC8o017456
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B3CY2hC1i6M
	iUSuv87D5Jm3r0035lg4EZdY8cNWgc48=; b=j/88b+CcFbQf5LdLKyp9gg/yCNq
	hucTkUaIzxSy8kKOePLODXXyHnun/YbaWXGPyiQNp/SeLyZ+I6LLxKWNjKV1GTC8
	LEFgFeqC5tDKZUzFsBFCfgPnSwyGdwFbFgLkj2Q+Tn2vBSfRvnGjKyN/9O0Ol/Z5
	wgNV1J89pGG1yepsEq1mrv+yadbEBG/JLStWvOtxvjZ15OIg7HFKq+cG6Ugejy7A
	xFjqB2LXuFUlD4TcZPdcurXZ8qa64svPhkf0a0b2WFMlGEvYqzo1/r0N8VeGl1Qf
	ZiXl3GrxQ0/MVNGCr612FoF+wOXjvcO6+Nbctf7VPMQKUan7RtI3WVGwyGA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjxrdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:37:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b54d0ffd172so55687a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 11:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739078; x=1759343878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3CY2hC1i6MiUSuv87D5Jm3r0035lg4EZdY8cNWgc48=;
        b=R6s3wubHGsfsYy7mGDIhBf0SZORPsEg608unudaIJV4lcbP7HUwLlq1kImLVJ1ntF2
         0q9x4oMfYQ52AfN/3AFGaEALXBPIugTv6l7g7QAf6noBuM7EgR7Qy3VWCFRgdDtgdBlI
         CLalmfmjVTbZeoZMSwvrGp/EG0j9/kdeEVHw0AkPbo0RBKP0o5U6qvWdaEsv6NPjsqjA
         9in0kkikDegaEE+UVGCVmKZwHrRefmfNIOxoQ2A3eyWmcbI8SOb02I7yuuEAcZHc8tzi
         8VxD4CZBRdJIIE9KdUBK1LeXl4i4HvzFrjh7qCaHXT/RzdHFJVWU6ADCm8J9HUH0+uMk
         c+lw==
X-Forwarded-Encrypted: i=1; AJvYcCWUYLGEXaAt+2DUgW5boZnySt1R0mKxawUcygz4VmhAKvzfCiDTHSMQinPocqZuvoffVbzQ1dlZ6VuVgxtQ0DjT@vger.kernel.org
X-Gm-Message-State: AOJu0YwdRp4IZ77dj80z4NYfRq0jgL5P/j3UAmU3cffJBvWiFFEslhW4
	icWjPv9kDEtCHWd1ZEzeXuqQjctHRGbwrAWp5+FwG6xXT7gXqMq12KQI1QVQdn5rR+IHioeZdr6
	WpYd35HzQSsKKgCNmbrwSUP9irTpEUxwiR+L2phHaGK4Ot6/8D8+IVXj/6+GOmUTNltMKQt4g
X-Gm-Gg: ASbGnctbblWow01U05KFy2RrExvlhubFW8CcTE+VYp3dVcmTlUWJujtFxpQ46/3Sm5l
	vMjIr6JYZqr+NgxGSlDzSgCRDKXGYEk2xSaVfYjWKOCm7Y6+jQRdfjK5T523BZGFKPqrQqQIeuD
	nSmCR/+rvdpFvyLDIFiISSh8cFAlXmt2aiYvUv3iboLsxX5fvL2vSQBvQ5UJzzNAo9BOUF/S9rP
	CVA6WzphNgyBn1ZrF1dhQvAAinaD11gslG++Eh4d8gTj+nn6gIwiiZoGuHdyNpL+9JTfsEgKDIH
	iT77NUF87+vFB10oAUhgPl3WHBrHxzPebDwxWnUc3Lu20fE3EDYxlAxn1lsTIatUGbxgUqhspXz
	U3gKBSSaj2qUgVS5sQZNQnCyA5/GQ4AMz3R3dn9NQf1ATGYS9O624Tuo=
X-Received: by 2002:a05:6a20:3d1a:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-2e7ccc59ea8mr699695637.9.1758739077921;
        Wed, 24 Sep 2025 11:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYFL5L9wefd1CvJSJ4agMNAcdiizATbs8L/gXpjLu4lLw/H9iBQnCCFdWLJ/wMVOfQL8qzWQ==
X-Received: by 2002:a05:6a20:3d1a:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-2e7ccc59ea8mr699655637.9.1758739077477;
        Wed, 24 Sep 2025 11:37:57 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:37:57 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: mailbox: qcom-ipcc: Document the Glymur IPCC
Date: Thu, 25 Sep 2025 00:07:22 +0530
Message-Id: <20250924183726.509202-2-sibi.sankar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 9YGWM05F1r2xTtOz_YtWe1A8WUPh7Y7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX9KtQ3DcxrYuM
 2k2rNUoIxN1ZANKGQrAfRqv5YlktNvZFd6u2gvy6dlRGiqtJnweXAeSxjcX5PwhfEInBlSd9uKE
 KO9NJMyAIcnvz8I3yPdQFCCzmLcGky1j9snHIwCrnQQPzdpmGXwrBudUrAMVbHjexzDitLrT0oA
 1I0GqEnWV2DbR7Epfs+nKzVK4DdEXEQ5dhSTS8C3VboqmI4ABXkJLBzOZuwcg5WPhwLLIxFogIx
 cWZrKoWS9Fg3ycStUY8yCOk8/b1vlaeUCvsJYuH2D/8vHWHJX+lYTF3N1rGW7gz8ryLKGdEGIXO
 uiJjplX/o+KXOrb6s598efX63pXbrY8akQWXk/MVtNqg2IWSnXanoy093NNNslgdhyVE7FZaFw0
 LkDeKiix
X-Proofpoint-GUID: 9YGWM05F1r2xTtOz_YtWe1A8WUPh7Y7H
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d43a87 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5H-Rh-Mn9-agE4ZKsUcA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Document the Inter-Processor Communication Controller on the Glymur SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index e5c423130db6..129870185884 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
-- 
2.34.1

