Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A1D3BB669
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623675; cv=none; b=jcrxUxgeaHdKs6v5m+ssdoOGoACWDHB92cjUopyodcSKRuRbT248AcOHTs1jtYiqi7Oh9j8f/UiE+Y/0OX+4expTqDKO+wNFHE6nXsXbuZ0LE9I63DIeA9cVrc+gSgZarOU8/oBYftphf9UP/ISpVWZJreIKHEEzoRWLTlHX8gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623675; c=relaxed/simple;
	bh=NNCt0N0t41VRnKjEySgkYUHwdTuRokTpy+IVDUMSGUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RlQWIV5ALOyvd6LmgfuM//LoMlyCeJrLj3DA+rHNOEiIG7FPjA2YcR/PJs8k1VFrGjuizwmdqK3nG7dpk49pe/bU22LdBZBGedIoiH1MYpw94tWxasW5K95Qa76Aamtri4rV4x/egQFkOPT6hb4FpzuBmzwAvxwq6QGdgeP3eyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzddKTau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+MJEPv7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzddKTau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+MJEPv7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6M1s14107152
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX1
	6H7AKj3I=; b=HzddKTauOZTa1ofO2aUS+ejh+prI/PdxoaRz7djuydmYXHcCkSD
	3gL2XfKrDa5Ae3EmgBS1C1k0Ip37dTrXZURwC3owxTmUC4T4mUvnoALJK+ybaZBx
	1VYE/dEJdiq1IVBAX9/JF13lQPUg1RCkNwQ6bZ//7yiyJDES981CqgXtb1lamiRZ
	8+X2tI8wOZ5Jkn5xebnllyvG3SZqioKjJ/A2Y35VoX0wPOxpMnxVlX2/0dDiNQvk
	h/HbSpzH3BrtDYqBF4ffrCEJI9hT4T5unvJWvK/yn9PecXFSfn3AKzpfda8xtYb9
	RUBWGqxfY/WT8T1qp6ket+np0/xKWRaWWMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqna7d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:47:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso85926321cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784623672; x=1785228472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX16H7AKj3I=;
        b=P+MJEPv7qG+c3HDHhm/4BuKIAZDN4gqMNE2+j9jtB0WE+VHHHyPXr/HWUqTQarDm4S
         n5FtB3o210+yM8DuZGL2q+Ggw6xe6xCJiJfmtsUX/7IyiPyEJecaMY1wOd9GWr/dI56x
         4tbtMAJjlEIigIeowpvr++HPathr5u9EKPcEcBo81S/pkGXl2pg6FzG0o3qowIL4/cOy
         DTUG1O0WYJCG3HJnip0zkMFe+JT9BNmj+bRZkH47HW1AB8RtbKcO9JUbmYX4yllny1I3
         nu0VHKGkbvu3XaOdaqdfjJYyzZ/d/NFxkyibSJ9o+Fr4h5vZ9hTQAVQIPJjt/DBVhTOu
         zGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623672; x=1785228472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX16H7AKj3I=;
        b=sFtQGVe93Bmww7BP27oyVQe8+IbeQzw6BIkxMryJfa4D8pLqHzejiZcWMA3/ik+vOj
         BOrwVFU9u0LLODntHj2quWjjc2DgOMqR8oQ0BpCLXWBj86/g23KJPEM06VKplV0jPO3g
         RQ+Po2DnwrQUnOstq3sW6kFVrpzQP+Jsi38Wgi/8IMxxuY4E93MTfOeuWXXjWhLRp5TM
         FdpZWD2w+qLsaSu9pjUDhM5f4aoYqLJTUuRCUDxKdHfLsW2u49wuXYYD7dkCkaO1CTUk
         mqDXnm/+FYBf0bH6CvSl4hZ9JhkJG4f/dCKNv0gvnTSetuBQyXbSmjdCAOLEYc2JoveW
         mXdw==
X-Forwarded-Encrypted: i=1; AHgh+RrdFh+aN0gEguZJCPWX8kX5Av4AqccuVuXVlY2jMTxBQ/WdM0BwNE8Sufd15dRQiLZ5L5Ykp1iKcNkHm0ywPKUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCas1SCJ44B+3Tkk8ajf2/d68JnfyUvtMWj6/v0yMCtR1TuhBo
	zgMR9GPaEiaq5LEAiv8w1kh3zU5OqJYVtUFM3pIhUct3z6AXnaMcsDizaitRLpygXKPlKz3iaQF
	TQBYvNl4PAzbYUplDXLBY2B5ZWWbrDdlpicBA4yDNtvTT0dt0SioGwQfTJp7ZEYpk6wlQfsiX
X-Gm-Gg: AfdE7clpsO87qAPqujbE4ZZLlqVTtCQzqfv6WLlGpPKGD753KoTXoi+f+JbzNgihzhF
	tU1D9R8xXVTCkZtB4WhAXdRA5/O0LMYIxBETb/JNCo88Puj8rGTvDKm9v62m9dGJcNd2UXqKxeP
	t9ek7f0tGTWPyIEIG3Al1+yxv+5rs2c70xwChFKHkyOzcDIzcit/DFC71LCq4T1QFZrow6dLLGA
	BZFJQjyXpwhurl+ZE1CVWonBfS+azSUtLkJjlef3LVyvmUCjzaSCbE8vGCP+bDXCq+x/QM8ZYmk
	gv+SOrxcJ4MDicu3JWs/5fpgnpedMsVCNwS62NFzETgt/o/oo9pBl+H1VGvH/I8qnaXVjLYpfDD
	vWCuBFAiH40YGCJu9
X-Received: by 2002:ac8:7dd4:0:b0:519:8998:661b with SMTP id d75a77b69052e-5213c7e6a17mr166080631cf.20.1784623672000;
        Tue, 21 Jul 2026 01:47:52 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:519:8998:661b with SMTP id d75a77b69052e-5213c7e6a17mr166080431cf.20.1784623671447;
        Tue, 21 Jul 2026 01:47:51 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm51140295e9.12.2026.07.21.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:47:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add power-domains constraints for Glymur and Kaanapali
Date: Tue, 21 Jul 2026 10:47:43 +0200
Message-ID: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NNCt0N0t41VRnKjEySgkYUHwdTuRokTpy+IVDUMSGUE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXzIuGunWDjbuXlSYES4/0RtV5uLuwxBypBZnG
 oyDfPrUvWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal8yLgAKCRDBN2bmhouD
 15TuD/4ozauPqc/fao0LAgR6c2nwoA2L9Ew9zzusxBcdeiHHquGhemKH7nxzpPZjM30Gx9X0qc8
 C+ZuoFkGv5X+PO50iJgXVjdK3fHXUegMYAb9iD9TOy/Ch6i+vjATwrOvRSPrPoDhuLfjZ6kvcl/
 Yh/ZdeI28AaAGw5ceclDIvYbgUJXCEtV+iQ3bm68qVkctv6QFm+YzCXGTf4QutGBqRbJRVi/two
 QRnsPbNpHDV3lVDh+m8dMRiGuBFPRlvy4eIAFWlwduTGp8P/uZScMMs8awoHzEnIDqQSDcEAXch
 24lgEyptMGylhQWVYBImoSt28ec6jEQkpYLUfOSt6RxaIXObV9lOTfPp+6AMaCczc6th6SFsrsn
 J3wZke78N/rnUSxO1irSfpZK0rhSziHfYMwuAHn4kkUOBBzkpIy3G0exL9LzHhij2XYnjIDfy2T
 asc/OQAPcNz2ip4V0qucH07ahRHxDfHiWdV90LUVqV+M95cDRNeB7OjgNSB5fHEHfSbAa0NfUnC
 /wHEOlzI3Qv84WlY7h4StL5QmeyDtdsIqHoHqfosVMQpxpbah6+srTePIebsAkQgBrMU8r3Diff
 7Vh3h2tiMsIAhPPJfglWkznA/Dc/sYQ+cjCkr3sAA7YZVr95NHCYBhn5l8vjimh4fPUIP+9WDfN cl5KS+Pk9at3rpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5MiBTYWx0ZWRfXw2OicxABZQFJ
 N5mr+pGx9xZY10A9DOFojM83WkaU8MeQMDdPgFrtTCS7G26cLkWz6LU31r6UJz608hjZctugAlK
 2pqbqspgm1oTGZaFqX4jSDmCUvmXhpmSed77lIJpFp6Aw5wfino+/LUW3AnKn0ggwpeCmmcXhIa
 40bQbzlrQL9sm/28rXENT1Yy5mz5hMp17ZJc4TnESvQ4cgyu94+g7HTBfFHiokPWHSaM9P6kXBg
 U/N+U6wDONSM7cXhyfppUiMHhVbWYTrzIt2lQBzXFGtL8xY/pJgaAYjEZGVu5MBm/IMLyht7B3E
 +rMB7i4mZexymFr7jbvFUZ0erNt32XHQAx5TLxR++0ettgqxVrn4cRNm6+a+lUNfK7JJ4XKiiVK
 c8SG7kEAm+dX2jCLLtLFcFyUC/jbbT1Qn8RrunKwDNKRnHlvxo5WdBCDJRphMKd2ULGduP2NoT8
 pDJJHIKlOI054gxQlxg==
X-Proofpoint-ORIG-GUID: tYH-RchicnxIpA-3Mwgz89RPDSpbfwtH
X-Proofpoint-GUID: tYH-RchicnxIpA-3Mwgz89RPDSpbfwtH
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f3239 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qxqRFaZUwwWtHnsma1AA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5MiBTYWx0ZWRfX5Ih8ZGz0BaiQ
 bO9lUsvXDhsJXEmmJa8IyG94f+7G45LT77yuwqLA157bVSACGn59MGh/+i0LoPZU+hHOfqIldLa
 zjQRzfnOypqryyZTIautlw4rbndtS0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210092

Add missing constraints in "if:then:" block for power-domains on ADSP
and CDSP of Glymur and Kaanapali Qualcomm SoCs (rest of flexible blocks
were constrained already).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2a4c527552e6..b6bd37e4b8c5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -232,6 +232,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,x1e80100-adsp-pas
@@ -269,6 +271,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-cdsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.53.0

