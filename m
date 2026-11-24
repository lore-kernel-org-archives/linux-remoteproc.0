Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515206;
	b=LACqSXgERSFarh1nUQFeV3Ul7BBtoOcaYskHrej8nbTJhxkW7D2RCmeji9Nw8E6hUS5T
	 qkTg7rfRuZL7JKg79qMHWcFPhFJyV777pT8cR0rxMAgm+A0AcOqa2VqG4tditDSO+08qy
	 5wWVe7cY0P2R3TACZMeQmzD7H4wboTQ2xPUSwBrbhSuNLoY0izTKCWJgF1GOATVY0FFqL
	 1dIDI0qNcTAo3UNAYbV9VR91ZlJ6HT8xtCHC1bNluBMejIlNM8/wrtCvmqhgLA4rR+ZNR
	 dcK0oXlP3WdO8GfYusgd9FzuCnoDD1SrJsHgYCAS4bAOIFnqPBuQnxj4gL0w/paZ4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
	b=NE6iGsXA7S/jRaaNsRhIrNMic5TwN74WssXJz1AwE+WecsWoyVBrgUHP5khi4zxioC3t
	 1zgLe+HPfRbJq58opB4pOzP/Y9mDCma62WlYkUD/8wbv3GPAiaUJeyVplR2KPPvwO/T9U
	 82bCRLdxVz97SKG0WFszsmViHiN5vMUUEs8qxNmQCXlWlvjx85Z8ErecR4SxMI+62CAOk
	 IcUnyW5dXSIsf9lDWhFuOuSlryEHq8v38Tbg/UTClzX6xeqoXrU+fMDXTkPw/rClOtbgd
	 BuAYj+qTeqCKFUEXfGVDND58OlrWmhXCh6cHczenmD/gBwGDFvdZyEzhNfd1AAP+Lmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iDNxg5/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMVH+aDS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B666E606A692
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B666E606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDNxg5/f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMVH+aDS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mFSW4136064
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jXZ6L78F6EFUbyACsiZAuSZs
	aiYj54Jynp+2S5EVBJ4=; b=iDNxg5/fCzrJEN/fr6lSGglP+NKGiUTg0bHDgGbZ
	oPvkxENj907CBnVb1tk4xGoAxAiY+79qAGhwrz1hkyrWqfC8oFUGSkHmrZ3/eGfM
	WzDlAKgin54Y9sGk9CmLcFxiKNfkiI3K2rl9+d801pKme6OnqQ1KZJi8HRE7UgSM
	dq7VCm9S+YK6f/zQgWJaSeOnhPfqKPSoZR9HtIstrS1pCDeeLLEL6MMNi82hDyGB
	W4ARPa8jv9Anpp6sji9UegFduGckSPRAUMCpgRPB43O8SsGg/8BLdMpNQyKc1waX
	98BfDijfjQViMKvKsekqkLTLYNkJTSxrWcCnfnSPqfOpyA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rph4j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so3160534eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515203; x=1796120003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=dMVH+aDSmOzOrv5taCHA3lxNcXLLrnBm22QohViRryiui61PbKHDboJ2yeIPhi9YlE
         KaAkGX82o5ET9dBT2gmYhKVyxk+0uGb0hQSRj2rtV96VJ22fe0tdzg9S/uWDRopPzNGn
         HOA64U2DvRq/Hif9HweGMzmnJEHTzUBztwy7Xat9rvB2HLsWP4v+w+872K9gJfyxOleV
         2yVQjxT4RCbrEPqlQTu54pn8J5Lo6Cdl5rIlAQNvf1IOFA4pQnKifxoGdjOPoVSwMvWA
         6+dvu/P4xDNl1rFS8+L/PbRV+1TRAIj+i1Rc8Fo1kxK/CMteSSdItAlM9htP/tsI3vy8
         dimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515203; x=1796120003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=j4FpN2miAFjvDJRiR+3YQLuJw/I9gn4yuk+gntXZfPVP9ehjr2RVvXYUpDtr2+DOE1
         SXXb3wCcd3Ov06R9kgaJVlNY9YZti9l+4qqDgAZqds9zD1VP/NPlLb2jR+sAupNDPPIQ
         sD6gC9jxFvRJY3cRvSnINTCkK39kH0CROqj7y3IAub9apHBa69KbcVld8A/0p2Sa/sNe
         GgROs71Vqm9pq9fTYbM5PolrGZtKvBxDwBYRqbvyYBbypIJep3WRSIp6U7vLTiIke/0s
         5oiYZPNEKKb9EbU58K2TC09llKABt6cvDPhI3lVjy/Ox1MlNbl1TFxa3Fs6EKLPOLTHI
         Fu1Q==
X-Forwarded-Encrypted: i=1; AL+hErEGmTQBIphRzOGzPwUUoiLLDmHisaQ8qB2rqpHy/gruUpR+Mk0zfrQ7Iv+pjlhBBDRdjVUccC2BxWExh3fOO4xD@vger.kernel.org
X-Gm-Message-State: APuU4Z8q8JUS5kkSVIXKPtYAByh/saSUv39WD2RqVeVn0J64UQ434SIh
	qOGZzXK7Ty8wTrpPk9MIUeqG/ExcY2scrlQGvgDq+YMJ1gAfN/GWvH+hPF3cRLto+bMQxqLerNU
	2bGA9PB6fV6bd57wJm0MgmyDh+d+g/KUIda/2Vs+MapqJpHkRR61dn7BZjtgzi6EhYg5LEjIr
X-Gm-Gg: AZFdTZfFG051fx7n9fItlH6pVYDoQ9efswhV1OYJ7gmDXueyaFjypDHBi7WJjhnQv0N
	xzvg51U/Y2JL97nCLTy6gaSXyz8dVH8Kj8LvWsW8ZRT8YeybueWlImJM8iGzWC/AZpK5oW4eoN/
	uy8HMci1tvkaUi49gHRQTTcUPx8kIHCwqyxLgp/nlVQMssWeR2qn93z4i3/vRmpEPb3Y3onmzWn
	7HE+gXs7y+BtpICT0tI7lQjzyeEWKXgSCs01MFPgiuSnCHauNDsNKJWJBNNciMJeCP+EFX/95H5
	VtFEIWrHZxcmzmcbXrKAqm5V1tDwg1Er1JM/QP61X57KV7oI38muw3eddBGx+WBne6/maLYgAaj
	MQYnSvz4L1+68Po0cvfZCfOG/EAitXH1rJfpwYdZSNDK7kMzFLgaX71Y/x/Dc5lwmVIjChNafIU
	x3
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143846eec.1.1795515203351;
        Tue, 24 Nov 2026 02:13:23 -0800 (PST)
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143814eec.1.1795515202730;
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32189994eec.1.2026.11.24.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Date: Tue, 24 Nov 2026 15:43:13 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261124101313.vezsh4klcxcklg2a@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXw5ALMDYnEtYw
 53scWeF7fSU69TCaJYPXU2Vv1TYi5Gng8oQMNzeaqHeE0cJMlJWVOqmxMM+cCE3qn5UJzKOKJur
 XOrYSEU43zh5vcTonsn07mQMIm07VswWtAwB+vdIzD/DCAMHvU/XsHxH+v3rn3xwdTJbJE8l+bj
 r+1X5p636/brdDRMlOtm9ph57D8wc8B5LQc5kOhxvxf+xkeUNVoyzK/i6OS8EebV/8meciZM3zr
 n+kY+vT21d7ltjYZ0/mxxFkfoJiNv6wp2xZ6Dsw4fBao8rFjktjt2I176VEIMby1vMykgvlrsyh
 gHy4UvTCCDIgiYZRjeXo1OdQ4++uS3UW500D1iM05kw6jmDQCoETg3zXJ9Yevc+emPlH0qdf0Ua
 XtXdXov5uOwKYVNvxZTwRvlShZDosnlEiNqQ3BDQEX5Oh9RGylmg4rLuKK8UHBec9H7eamr1CvU
 UOH3sB1IegoVc6O41PA==
X-Proofpoint-GUID: SmDVeZB6_is4fn5S4I3bQQr3xR5P8-0-
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056344 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FHuKVeeB07r6xee7kg0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX+/b6CEle8iJN
 RBjL7Pyb6op2kywlSbD7no8RAA+GmRa8Rm9c3cxmf9uHE0E4axtOg2gzHgVWMejVTqcsYsxHr8D
 7lbg3ouGg/l31J11rwcn5SKXalFQ450=
X-Proofpoint-ORIG-GUID: SmDVeZB6_is4fn5S4I3bQQr3xR5P8-0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:50PM +0530, Komal Bajaj wrote:
> The number of IOMMU streams used by a remote processor is not necessarily
> limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
> and MPSS does not use any. The existing single-entry limit therefore cannot
> describe the LPAICP firmware streams.
> 
> Increase the maximum number of iommus entries to three and constrain it per
> compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
> one for qcom,shikra-cdsp-pas, and disallow the property for
> qcom,shikra-mpss-pas.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
