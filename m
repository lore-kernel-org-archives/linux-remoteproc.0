Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BF02EC569
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 04:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339483; cv=none; b=Mmn8t1daX4SU8cxsdwLkKTVpBk9j4ih+eOH8uDZhyl/k/p+5L7f0tFeDQUBCojNCkei+3LUi0oiQkAr1p9IusieKYGeeOEpITIUpaCIEiaoYloMBNP47S4Nl4oygjl04pHPtAvKXTqkzjS70vzIY73f94thjvvQhhb41F+DDXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339483; c=relaxed/simple;
	bh=mwiZnGqzXPX6Wzy2zqoj32rz2KBwYDC6krIj7WNlPuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT3WuxGmrq3YiVRIRu8Q5NAVfK1lk9Z13CrQ93/TSwR6wC9TiST8cIE/0bSMaaiQ+8KVQhIOkKpb1sVBs3dkDMfTb9eTCvx/DHjxtVG7sxQ+HrxAXuq1NVIL8tRuGhIZ9JudQWdZB0mh7Hd3PzOHPeKfbWvOlY4vbcrmjJ2rPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8er96mS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0dGvBJn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8er96mS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0dGvBJn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3Lff41391564
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 04:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cydcYQBkNu10JNQQ5nGjpPgr
	YyQRvScUyJbqa+hwnJY=; b=M8er96mSREFKs8tqekkQ63uffWIcBxuYMRfQLrBV
	7VzO5OoWhUXKu5zfrfc8MHNYRL18CZKn8n9x7JD9MAzb/d1uQ8rlDnq5buTSQNEs
	QQ3gj1zFrYNztIbMmnJe9K/V+XWsIBwSI+88fRRegIWk0FzTN4+l0KfU+CgJ6QED
	7YqfpjDOn9uBx/tFd+LYBe9HbSZaXYvmqS/NO6g1zy4CzpkO+Q5XotHrcwUiW/e5
	H7YCRe+AC1b+Z64gTCwOG/WDHWuQblxms8ZZaYQazJ0Py6Vt2Qq9nsl5Ns/B6Y3N
	uRir8E4Gu6c7wKtJK9z2lJUNkJvgZ8UZJo/emI1SogG2rg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx1a5bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 04:04:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso129171371cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 20:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765339480; x=1765944280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cydcYQBkNu10JNQQ5nGjpPgrYyQRvScUyJbqa+hwnJY=;
        b=W0dGvBJnG4ee9oRR9K28EYrcgOA6/J+nCulLldQZeBPpWo3092LWGwSg7l8OzhmFGo
         t1rF2bFaGbO/VYjrGEG2OCnGnw5Y93fkueM2fGaO4pZMO9324hOPOusqqhOq5kQVHPLc
         oX4ImIehe3jid0OwAHAfigsuwqLfpSdHKILHtacKbILX4yeznjgBUpqp9LK9aak1qlUZ
         OqOhWhWz/UKdBG4GYmvUm3IYoj3mXl51uAE2CSViDS5vB76yoQYXawkF6XHd4XxQXnh4
         OwDyF5rxBn2gsdnxcFY2UrNbwVKSYXas369t3FF3ki0j6X+ldCjNnlmTxATnGWwwjCLs
         9llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339480; x=1765944280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cydcYQBkNu10JNQQ5nGjpPgrYyQRvScUyJbqa+hwnJY=;
        b=mVwgdPCvA9713O/SdZJFU7iB3wcyQVbq4+2lstr5rC/p+JqzOZzJQEFlycl0BO7k0F
         eG8j6f1i+TUD/PMN7KfrrwRRGl2iq8L18eErcIPqGuMtIYNeRk94nIXDABWm2VIEsBNm
         7e+mPmF6uH0DSOjfMK+ZVqwJSluAKiV8+y9FSJBI1SF73OOVa53kkYt6XrZZ4vHpzgu0
         kx91zeYeAHvho23TlasM0vkkE10RpR0AiPRbWxrvewOV0qUE5LhJq0TWV1dsBMJBmwKs
         7SnqHeC6A87uJjQ92kXMtr54PEnqZZv+UWFXJdrteyhroV6Umrm4xwL3NsANsEx+OnNs
         AA1A==
X-Forwarded-Encrypted: i=1; AJvYcCUW8d6uezrbLV3Qxhcx2KMVsb4YaU04FSqVjdnwlpG7OUlOa6c0ayNzElwc7S4a9hiMp8CbfzcDzOgNY9Wan9qz@vger.kernel.org
X-Gm-Message-State: AOJu0YxswPhAY5Z1unmjEsid4UcQeb676vJYfSq63q2z+YTvPbbr9rQ9
	bb0WNEBZyUIQyfR1CfLdZXWOnAgwdJ8Gyv8R/y5tFBkTgk/y7nBGLfB1fEB2RB4tTsGA8XNrppN
	tMsfgjnkBkB9M37bOD8y8dSt23+oHMHPcw/FpmVsUYGotlg26m+hyome+iK+yrhMfqm4pJq5I
X-Gm-Gg: ASbGncvhtCzUd9lw4Oi8qDPDPSWSs1BdrDCdWkUEqdToX4mZEJOXFHOKBqdFllz5oJ6
	tybiIEqlIcayGEIR7WmgeJK9Om5HZ1hAtCf+gsrv2HsPQyDpAe0o6sVMW3s/dywvjRIJ2MVhwyN
	At9+q3p85JLUf4Q6MIdBHsswqU1YanzlU/F70jGckOMKxG9dIyIda4TD71VZpO9r197LnZ3DMRZ
	57YCiv9fosmqsPuUmuqz8dYPwW84irKIXmbg71kPutwJ96L/Sc4lst1FE0P987dG8wZgdCCr+/0
	Ja2rGI2JQRGex1t5qCltmTc5RjADFA2aMcuSjONYv2J1wDDySvf+XWtMapRLFLTBIjYl0ywTrHp
	/pL1LDV2mP4xSmG3GREIWwnTA1Jn2jWdL2pWS7emPjYOrrghp8dJyxen8iTp6Vi1NAL7r5hZuUz
	tvhoT9oZIo405NXvEXj3YqFmo=
X-Received: by 2002:ac8:7d4f:0:b0:4ee:278c:bde7 with SMTP id d75a77b69052e-4f1b1a69a8cmr16086991cf.23.1765339480121;
        Tue, 09 Dec 2025 20:04:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELegpaWp/DtfobLPf8iUTFfZHsqVcFzvfMK9O6xBW82VBZl3s8tdLAVMybw2PiYeUjivSIGw==
X-Received: by 2002:ac8:7d4f:0:b0:4ee:278c:bde7 with SMTP id d75a77b69052e-4f1b1a69a8cmr16086701cf.23.1765339479593;
        Tue, 09 Dec 2025 20:04:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c281b7sm5742276e87.80.2025.12.09.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:04:38 -0800 (PST)
Date: Wed, 10 Dec 2025 06:04:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: ipq8074: add remoteproc nodes
Message-ID: <rtegntuq3ls7hp22sic3ebktmkkvpyacq2db37s4bjumv7vkro@w554ajywauha>
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
 <20251210003729.3909663-4-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210003729.3909663-4-mr.nuke.me@gmail.com>
X-Proofpoint-ORIG-GUID: TX0xhVIAeJ2wJ5IwevT__cbv57muLNJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMiBTYWx0ZWRfXyv8rc9bC+PcA
 ZjiOzHCUCpaP6heXWuZ7M95FtkMSGHrNmCv5U8XcGvHuyFWxwJ3axQgDf0c+5slY280j3rfmIs1
 /cyokldp0gXKt4Hcwxbzks05FdQoofNkXIm/UrmaBgcK0fxcI+MAZxr5pTLzNte54fTyt8tBfmu
 uSa67jOM1eYbbIPyUSy6Z6F3ZK9MDtKI8Wacgs22WcGWCj4HD7QXRXHh2rXCGRA5iVkGdODDNJc
 linRk5keH6NNiw6WrVWlsm94QYI2+gn2LCb3/ApqAdwvXsTYa0mGalUPlJ0bInUA5Owlaaj6FPM
 IMGak++5vk2BL9L1nLkme36YMc26Z7ZulWFWy4FHrAbe72FUbbuDJy8APfBfNEu5dqiMITSABPx
 yKkLR1KrpBb4EixnV6C8uUYkcJ9LxA==
X-Proofpoint-GUID: TX0xhVIAeJ2wJ5IwevT__cbv57muLNJK
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=6938f159 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=Yt0Dtgn1gUSMX1JQYPAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100032

On Tue, Dec 09, 2025 at 06:37:25PM -0600, Alexandru Gagniuc wrote:
> Add the nodes for the WCSS remoteproc loader on IPQ8074, so that there
> a use case for the DT bindings. GCC_WCSSAON_RESET is not implemented
> by the GCC reset controller, so use a placeholder value for now. Leave
> the node disabled so that remoteproc doesn't start up with the missing
> reset.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 79 +++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 256e12cf6d544..86369fa680553 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -108,6 +108,11 @@ memory@4ac00000 {
>  			reg = <0x0 0x4ac00000 0x0 0x400000>;
>  			no-map;
>  		};
> +
> +		q6_region: wcnss@4b000000 {
> +			reg = <0x0 0x4b000000 0x0 0x03700000>;
> +			no-map;
> +		};
>  	};
>  
>  	firmware {
> @@ -390,6 +395,11 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x21000>;
>  		};
>  
> +		tcsr_q6: syscon@1945000 {
> +			compatible = "qcom,tcsr-ipq8074", "syscon";
> +			reg = <0x01945000 0xe000>;
> +		};
> +
>  		spmi_bus: spmi@200f000 {
>  			compatible = "qcom,spmi-pmic-arb";
>  			reg = <0x0200f000 0x001000>,
> @@ -1003,6 +1013,50 @@ pcie@0 {
>  				ranges;
>  			};
>  		};
> +
> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq8074-wcss-pil";
> +			reg = <0x0cd00000 0x4040>,

This node is out of place. it should be sorted by the address, so it
should come after timer device.

> +			      <0x004ab000 0x20>;
> +			reg-names = "qdsp6",
> +				    "rmb";
> +
> +			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcss_smp2p_in 0 0>,
> +					      <&wcss_smp2p_in 1 0>,
> +					      <&wcss_smp2p_in 2 0>,
> +					      <&wcss_smp2p_in 3 0>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			resets = <&gcc 0xffff>, /* GCC_WCSSAON_RESET */
> +				 <&gcc GCC_WCSS_BCR>,
> +				 <&gcc GCC_WCSS_Q6_BCR>;
> +
> +			reset-names = "wcss_aon_reset",
> +				      "wcss_reset",
> +				      "wcss_q6_reset";
> +
> +			memory-region = <&q6_region>;
> +			qcom,halt-regs = <&tcsr_q6 0xa000 0xd000 0x0>;
> +
> +			qcom,smem-states = <&wcss_smp2p_out 0>,
> +					   <&wcss_smp2p_out 1>;
> +			qcom,smem-state-names = "shutdown",
> +						"stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
> +				label = "rtr";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 8>;
> +			};
> +		};
>  	};
>  
>  	timer {
> @@ -1182,4 +1236,29 @@ wcss-phyb1-crit {
>  			};
>  		};
>  	};
> +
> +	wcss: smp2p-wcss {


'smp2p-wcss' < 'soc@0'

> +		compatible = "qcom,smp2p";
> +		qcom,smem = <435>, <428>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs_glb 9>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <1>;
> +
> +		wcss_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		wcss_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
>  };
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
