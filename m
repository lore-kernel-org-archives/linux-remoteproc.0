Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201732142D
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 20:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831956; cv=none; b=lJ0XeezCy6fiOIN3EjjPh1f3UKQZVNS/sDGvOJkdP6f42jJvM42RI4Sj1dLZtlG6mVAuvtYq17jhgu/rl752UIzAvwML1qz8QyCPDXepIgLxK7TigVPpCQyaXOGdBsiYvpvP6kVMTd4TSVV1JsxqIun3yVL1cIdms889HCpxfOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831956; c=relaxed/simple;
	bh=qyb0szwfr7ZYPjyRtHDrozl0B3Vr7ddyIprU5J873KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiWvtLT0OG7li56wQlpjMQzQmthUuiQOxD8UYzCdJYBLj2aRskq+93kDr8jFICdwS30eYve0/OwFMSiRgVrRJzTchOx2Guk2eIcNzT+F+d2YUoebDeKPtbXXh+46UOciEvVjDdqCkYhfjg7/HrHu2wXKPI8GHd4Vp0CIqinkBY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDZJkovh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN+nv3NO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDZJkovh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN+nv3NO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFE3oSR4174108
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 20:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XLQ7LoQ8/CTmIBAWDpDu7tzK
	4curoa5oyocj/0FLnX0=; b=oDZJkovh7JcStoql5yuS+5zONGDvUF1wvaN6QbY5
	pob2eV3dFvVg9mcolIo/qyMjdiOspQt0jSNw4c1eJj7XBZLFUabhNp4kxbcIddVA
	MDxR5x4FSADp8oAfbeY2QsmtDQj6CxK3UXcnAEl1Pjdky2WrQCMffTwx4KzvjksI
	WzmQNBbY81hm/GOShRNGI66BQwx7bylBvlk2D4tYnOSJ39k7/9bfQaxusVZBhzhD
	YgdIuzWqBUFFyzSLRKWPYX1KlxksaCBCJQfKJgPyc6/VL7yvv0VXxfjFT/JF2WeY
	sRxKGA5t4+6E9ss5AimiyYfcbMRYZCaTpz6mi7y2jBkujg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks016yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 20:52:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so86528411cf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 12:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765831952; x=1766436752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XLQ7LoQ8/CTmIBAWDpDu7tzK4curoa5oyocj/0FLnX0=;
        b=BN+nv3NO30yKt9Qh5/HAt2X66feR+CtCQF1jP4ogdoNhfT+YOp0IQr/n7bzDbOVkc3
         jO1JpAWQ8sj/Jov5hhthX1EgXhLArMWcA/MMxJM5aMwMQAYnkN1XFsvMUWxN9v4kfstO
         VafpO4HrUNvJ7QZM6IpzwTTbw6Yqzlo9KW2P5ZtxQtd1p9r9sRbukvk0rhEp1dVHwC+N
         kNw7MjkvUeXh2AuN+2kgFuHCguCXzrzqNZN/MSBUbe/t1UFsYaDBVOhCylBQXbI4EAcT
         yIpNOSE/4va6ELUm2wJVOh/3w5AcT3p0PW9rjQp0vdntulHjFT1rKzKPwlj3gxN/68/X
         6hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831952; x=1766436752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLQ7LoQ8/CTmIBAWDpDu7tzK4curoa5oyocj/0FLnX0=;
        b=JDd1ps9s9pZRLrKep7RPPPgm90O9ElteCQ4N9eLX/mo88zDzjXt9Hw/k3jDgbxMS4s
         oFU2KworBfO1y4as3vAbD96qcw4h45yUmiR/ictyx6nI/AXAwwCe4V2m8erpHzKM3cDp
         NVHJSuno1b6HwJ1o77oX4ozQNry3aDq1JMevRnABRaz27rL5vxy6WQ77cT84fFEDhJGH
         +2V9bU0sXMhwqvcntAyamqVyfGk7hU81jHUWm75aW+Yxj+s/d7Fm/Tk12+t0dNQ6duim
         urIKwQnlCfWAh9cUjNFxTncJib7yRMzDPA8nwumkR2yGxfqaetGLutzjqaCSUuRXnrVO
         wxvw==
X-Forwarded-Encrypted: i=1; AJvYcCUZAwaauVpPhQ1mcEtv//dW2niuG9VAh3PCbEgg8RnykOGcrvAHA+QH+Df36f2wD05dm2d04sxNkgbSDku4sO0z@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkrM7AGq2t8Vvec7DC2GEpXc4VaaO5h7zE0Xwp2diPoW6tL/8
	hxCwd6SIAA04ZD42iptuWhvE5bJ1fiLmfbfccUuNOHm/b4cL8D0bfipoVu21iKG4lrWh9JzHc/g
	Y8VVM2gCeObm/rcKqE9/1ll9MhndlV+rO0L12dJPeSqowFwP6UiWTLTr7+U/Wr71n//dDKj5I
X-Gm-Gg: AY/fxX7F5a/GRdxQ/gW7SUYztwOFsrcuc9kQKJVBOaE4Q0/z0QK83quFyiBtkCdZD2D
	ZSKIu67RTmZ/67bCnwjN8tRYmWxFR65Xn8rmXUM46VscD8DvSeOcsi1SUccOzBOWZEYVdtPWtY+
	BE0XbcDcVE9u9Kdc60BJ4xdh1noeh/BP84V7xOv42oRseqq6GA7M1KkDDHRoayRtOQCU06PpDkP
	qzh3Jf2z3xUU9H8yAW9zImtBAzYRiDvWXewq5zeuIZLFvrypqGPiEjjaotxy5wEeBLv8lJU4Z6H
	zOSzw8OP8aAaclK3XFeLPj6WJi75anwuZdgeK9jkKjdh7sjSd/J5BoAHZU46y4A9mmZnXlkSMqB
	voH3zZibK1sOgGiThTfJ3LZ2Y5Trje6XbbBvGVvyVdpjH1Vj7th+UuwfjH2KEApCW7kt1q8A0CV
	IX4Dgnjx6PTZ+oa3yxUGHMH30=
X-Received: by 2002:ac8:5f06:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f1bfb9be98mr220664271cf.8.1765831952066;
        Mon, 15 Dec 2025 12:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd555za9qNyH+D/h/1c4vO9Fu6GUCWOXb+OAovvIu3zQYErtvrMYhhZ+ntOg6X0XWZMv4nmg==
X-Received: by 2002:ac8:5f06:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f1bfb9be98mr220664041cf.8.1765831951681;
        Mon, 15 Dec 2025 12:52:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da503b7sm137606e87.56.2025.12.15.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:52:31 -0800 (PST)
Date: Mon, 15 Dec 2025 22:52:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v7 7/8] arm64: dts: qcom: ipq5424: add nodes to bring up
 q6
Message-ID: <lxxrqp7jccgiiluidrioi3nnjuzsosi5elasj65miiuz3miop4@mgjuzoja7quc>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
 <20251215-ipq5018-wifi-v7-7-ec4adba941b5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-ipq5018-wifi-v7-7-ec4adba941b5@outlook.com>
X-Proofpoint-ORIG-GUID: 94dClQ-BOBvVloUEaKnzHRP9hHQf_g0d
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=69407511 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=unjgD82zaOGdZq1vsYsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 94dClQ-BOBvVloUEaKnzHRP9hHQf_g0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE4MCBTYWx0ZWRfX607EzhJG0+Cy
 jsxoDgEOcNKAXxKQ/7uM4NQYzYxbMYO+NOlN2syxi9FMhFYkhBwSS8xZlwItFlON4wPoRK4F34Q
 59GRf264mGbWQ9LKT4ATh3aMfolAOyaeUGRrGAJTVujQVBwTjSQsegt8r0gl9JJ/+Oeme5iRvMF
 UEKZ1JVPjqYAj0c0AcuSy5RlhCT7WW9uLnuE1Euj7gmf1I50vVucV9yWcnN8bhuoxRUbYFdw3Qc
 U8RYtF40d6Ro3xbp5f+aaagc3GR8Yc0rkpepTrusysp7MrfQD6ArSwDg6mmtD12XDCbRkLDGcND
 615vnRPJq5vLioMehrKdyI8Zhd7AoTVeChX1+6LDZE/A0f7toFmL78K2TW4lxyMH0Icv2YhQABL
 498mlr8wjxqGXuw6iQYutUuB2cysZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150180

On Mon, Dec 15, 2025 at 10:35:12AM +0400, George Moussalem via B4 Relay wrote:
> From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 68 +++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
