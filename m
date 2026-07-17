Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C2376BEF
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278230; cv=none; b=bXbGFGSaQZ5II75jBguVocCXUc3Hks4TKfjxJURxOxlqedS8dDPBFuos5zFSH5bJlqwJ2/aJrCJw4X5Fg7BGaPP3kopz7p7jZhTCe7KFZbA12nlhNA/hhRsf4IosPh+sfu9nehvUD+Qm0OCWElfY+syUPyJUu4YdDW+8d+hcFIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278230; c=relaxed/simple;
	bh=oKGmd9VKITYAgis71P4kQGwc4rXok/tzjeOQCJucBHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3R+PobEoMLZUWtonaKo2PKLrBbU+mjAfLt6V2AU3GlA95jfDhR6kLsRdsd9kIJ095cG6CIlckk6m9Q4b29m8igtQaFwiDowJfjQy+qUXIG9NHwITHfN8WlO/8MgESLPjbJhcXRJDB4e7/PwIn1gKrptK5n5MUuOE+yHQdxvX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meGs3FhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hme2WIWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meGs3FhD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hme2WIWn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHq22098537
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=; b=meGs3FhDszga7BLA
	U5tmgAPuL8aaJGrRpyOVZeqV4klE4ljmPghPzo4jFAOXSjJTama2dhuDt9eGBAb4
	k1aPMWKeJADPBzT8W5OXqSVm5zoLONijScDI/Wvc8+736I89g61+FI+qPK4iFETO
	WV9AE5OT3SeSkfsKE7PwoNbTWC+JCwmNtuxpzlur/Viaq7v8ZjfI7LB5SnJ0LeZi
	3dJmmkZMo1+2WADAb1PppwOy7myfF2VY5taDjKaRgKLrDwSu5sJujLgYZAi6Jvko
	ooMJlJIi6L/LSsTjR+ML9Q/f1vSn4H9FZZ9CefUwLL67akgPdCN8PDYuTmN9lbJg
	dniOSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jvub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so24017731cf.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278227; x=1784883027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=;
        b=Hme2WIWnaG0MK5adiNwDGrFaimIdjptyODgsjFyMUW2qBkuakbiWMjtQEG0Gl25oJi
         aQH/snNuNOWAsoOnNUu69S11Op7wOUQnxIQXeyRrV1QeEH+XyFvpitrKnEgpuGfBYfnX
         Am8W5lXob/he0Nh/pxtR4APhtgjZqIwTCVPlDan7TSF+6vkVgdsabLHgzjPdQH9T6n/d
         93NiLmews3vQho9DK53laxqHRVgBwZ5ETAk9e6hE1PFpHzpSl34YhWmq3RWzIMiRQPzN
         6zzUQmyX0KdO0hLpdU9t0Z5U16CRcaZMiV22ACAMNyaKk0Cfon3FZNiBX0BNqtgtUtWG
         3WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278227; x=1784883027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=;
        b=XU0RimaVyLLovvPco/8XOPvdclwpAz6t3x8vmsRoiWcfoJrSsqKti/fhS+tr+pSwIe
         alJFJjUtYuV1tdXOWlv15MW5b1GqmsY2v4ge3muvTuOjaNUAf35vsJ9/qik/soTr0WXM
         5k/aeIOvRuul4Kbb6IOl52MuKcfX0gwVQFhBElrfGEMJlHVQUZqwl53XnFORSobGDjpa
         CQuR/KQwy9fkF4662+tyjyiDX4wb1FIAd7C2BKd04uvkeFKvtXeEQ4UbkJZqREUt2/vO
         2C7mbR90ucasW/42P1FbA9GfPKcz+oPlna8xCOyZWz16279De0xy9zceM+WhvYV9iM6j
         yeig==
X-Forwarded-Encrypted: i=1; AHgh+Rq8KapbfYIcoPp6ScOcDszdghQ3DVmUp2BORViMl2/M61u8iBO2GXXVpttaiwKpgFi3fqPtK+LwVTks+613aJwK@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXA0LRwgxpE8rUffUIxmtBrADbWMkCFEiDRTUggLAz1Yy6JbH
	UZSF2tQqVVcTREUQqkneifQXsq1yDb3jAZ8p4VyMU8xUvu4lufV+0GBvOChhsWgzTG4QE8deCgT
	Y8ak23l4kzKB9Dh1PCEXsvBPBovnbrTuxSZlYPR8t6rrGGOhDUSJwGca5meNFYvpM/cPc/A+4
X-Gm-Gg: AfdE7clQqjuJoEMaaijTt9ddsvGoYWbX2tjUR2Ah9ppy0AjC/GELFqDYrWCdKOiIiBh
	uPQSjbrSP3jwotMNa2KN+kd6wJrw0QOaJVN+aZzIyp3peyrjPDQd3IhdOiZ34AA8Q/Az8GCvtFL
	s+OdkLFVsbygpBmUB492d5lcVRSYtldkMsL3Q2GoyMswlGaZu/xtKJtfhvZt6Q+Au8GLlCccF/c
	nE9aQzMnmBzdaKKzlteuKzvzLu+BLPpY6pB3O77SHxm9QoV55DEeaSha6ABBh+cPsyVeqiT/Z2T
	TB0GRLHRoRFbK83f+EPkQEoxkUJQ3eMHG9JFAPKr4nFa83ge5/UjAfhBjV1Iy8BKKvY3vZ+ls4e
	kEUs/ietRZ8z40LINLGvsHTfh
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr7960411cf.10.1784278227291;
        Fri, 17 Jul 2026 01:50:27 -0700 (PDT)
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr7960061cf.10.1784278226882;
        Fri, 17 Jul 2026 01:50:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6eb22107sm357981a12.0.2026.07.17.01.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:50:24 -0700 (PDT)
Message-ID: <7cc35fc2-9fe7-470a-b068-8b088cf1fbe7@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:50:21 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: add SoCCP DT node for Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
 <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX4RUrpIx41g/k
 0nYLEVx2kTOg8ECMfN4smREPI8h/jrAXqpgomXKmr8j4WmvqQBjRqLcC/ARAEoEFfUjnVKixwQo
 eTM+0YnPqIjN+sz2naTJcaPPx/F5ocmIxmGq7uXFeKtS4q8080buj8PVg4z/ux3eUoO9QjcmRXn
 Iigx4rR8Tt0G7qH7LwFLR5Yx6I7Q1QvgFOVfJHxu1E1OEx9FXTpqLNOlR2G2+IQFmT3IQ9SqfbJ
 AAGLWAoycvFavCIQW68NRZNMXWUpKs3M+aPD9VwE2ONAUQhLdDU0R1JDwYZjQsX9ysJUl4yKQeK
 IgduvS3XV+6siIjO9luUI74WicfMJ2oqfNMz+ydiZHOezvWuCaoQ41zDiFHGyBd+tqGaweHtXsh
 2huyR+i0wpa7E/Y+0Hen7fSycjtDEDD3rgxMGiNEgrt/m9JThCPpxriFKwZr6/hxmoyv+UhWdSk
 s951/beJ3K6tu95k8Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX3L/BPiRHe1Ip
 gnOGnZfd1jn9VfaYaJwVrOQNah5ZJhy/mBK/zn458tIJJOACzWOMOW8nhm1ARNsbcKazDvVimIM
 jcOi+k8KQAPY/7i+0pyzC0iuF5dAbuY=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59ecd4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sWIZHQe7GSxdn9xkVP8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kWhwjYvEttDdKJ68aA4lrXCsdWIrRq9g
X-Proofpoint-ORIG-GUID: kWhwjYvEttDdKJ68aA4lrXCsdWIrRq9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170087

On 7/10/26 8:39 AM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> 
> Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

