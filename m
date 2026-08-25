Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0504229BA
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660717; cv=none; b=e2vy3wT2ZIyQNiuyO1kv399ge+C6l4pkRq1XKriOtRxk2pIImOlt35ixwIdfWKoFiFT88kqxg29utZi9MjHGy/UozaNe6+hOhL9WSNROvBmkuqubYueKudwl7Rs/FamaoqltLY7wD7g37vDUUVLz3jFuooaEz3laMl3a1mssRqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660717; c=relaxed/simple;
	bh=JpvP2FsKNOLwyzEV35Oy7RuDzh4oUbBOacuQEwMmnbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq7k7vlyhteoDrWJxVN7C2dkMVU0qpf+BotG1FMZJtSumcMEjoKzkOF3xPi1WvSymcU3uUa/xUYH8bCMkLsDpGj11rBX0OdPrBsQd9zfgXOvDP3iIk/TLViAsFdYq9b7XSZuT8slGb9bLZEfMm11cMR7mATyAaD3Dw/ZiaJYI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKGA+KsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDO76iKi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKGA+KsV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDO76iKi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAv05q2773019
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 12:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxvYHaduN6TNCEf+tZMW4tMw4ZUU9VGjbq8UEfNnSPw=; b=JKGA+KsVLsBLyuvw
	xVq7fI4ge6xMju05qBRPExADjgpuVwDLbXTXFPEtaYaajwe6c1ZHgkhSFeJaMNY9
	Ju052pqAkgFZ31gdzFjlFfjgNBXHL8OYV/r765siaLeUnLE4JPk23+/ARmDYMa9x
	XyUWZFzt2CJHoV6EvjW4D4L9RREnzTHnLQmAdnRCXSEJpwZ7iISQPEqs+AlWZLpJ
	oc6XP+uHUCgngzpLKqzKmwzAXzqnc5IOzheGpsSddWKZor0+TEWc/5bGv0GDn1EH
	YF/JPAlC6My1LxuyAExsenqNkDwUTFvjOTbC6JcvBEX9fCikEyFKGeT4HT/uXnT6
	yptwJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swrbycg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 12:25:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so57501285ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787660714; x=1788265514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxvYHaduN6TNCEf+tZMW4tMw4ZUU9VGjbq8UEfNnSPw=;
        b=bDO76iKioX3lqGxCWSUCWSszaVJYfScGH8eO6GwdL7dL0+cSTRcdeT5FySRYEd8pIr
         JGIst0FsyujKMw8VXcqX8e8iIpHJVEaHAI52R2Mcws+2JPM5PWlrPGMwRO76CJ26aYW8
         KptNwWPnETmhFdCUEC7eCtq+DxnSr7csN1kZsYaFQf+NjcWu7WvMF8hIBOppaVTkdT5O
         7oz4Zrhongh0/MLbzQlMuOfUky/oEKDhg8JT8avbZqhhtht0k4pBiO+D/7yeIWPd+oW4
         CnMyyYRqxMMMNYLf886TixjdWzQ29xgFgrw3dPNlhHiU+5JuF+BDVTnO+8MJJ8sK9jBK
         4Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660714; x=1788265514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxvYHaduN6TNCEf+tZMW4tMw4ZUU9VGjbq8UEfNnSPw=;
        b=mzesNjrIZWXiN2tApfTOJ8yUg/zVEC+XPxjcBzVrH73HZ1KQP6hN/d3m8qiCnwc4Ha
         xHxntW8BHUjsjtnQ5AdKorTMrJ5YpMmXnhGiJbpU/hCxB+ZmIGxIivC3Dsrx9YYg1Q7a
         JLSdA/qNY+c6GKBlnHmfgF5xz+s+fBrpCf4fM4qhhJ8FJq9vlR3zbSS5fh224WE6lQfz
         oRUg94pcr/6ltqYRximi6PuGey+mDVmvclGR2mr3DLtipe6f8Ewef6YrRp7/ZQV7IVs1
         Evd7oDkcOVrQYKblNo7CrlSUUsw1jOPFmTS92o8bna+bLQ5Jg1MdxArKtvjOpqMX3bnr
         Kp7g==
X-Forwarded-Encrypted: i=1; AHgh+Rozu4f2wgumZ5rjjfnZNRrw7dCKXpYwGn4SkknQFxm4kwsNfwHKPBtDsz3xGFHDti4qwZQxVxc05eBNSppE8bZy@vger.kernel.org
X-Gm-Message-State: AFuF++kP3gganjdSCgZJNFP3jkXu2Y5zALM4RtkktOHyggtaqP7JWgiz
	i8kMiu/SaJHDhnipubO3RShv/jpdWsAXy3+SFCRnWZE/HQRgLRZZCBcM/AUd2t+xiL24WsHZXDA
	s9dnxiO3AJDNY3U+x06+5mON9BqnNcugU5WA9DBC538ZyXy/Lbd9tUy3q8+i/n/DHOElXX7mZ
X-Gm-Gg: AR+sD12MLhfz7UQn4eTAaVXqlujLoJv+iTBUKy5m55R1bzr449Xl9NY3dsDmcbka2dv
	B//SVFi+Ai7i0zAmEv31ol1YC82T/aO4u3ljdDaibCvbnlh7OqdSjVl2hmFQ5TMjWDz7qWOctPp
	oW21wXDMsD8yMB+uBsSvyKLiHDeDavCL7NDDk5ZLdE+hfN7K8ZMnH7xt4VS8Yk99nFEoUVyphH7
	51Q2JVzvTwWJsaPCA1fk7fQ6rTsLmQq+yNVcx1vPOYw7e0yoo5Ph1kvIItFlGdjAXnJznaTwuDL
	ouC6smsZANgLBP9mH3bue7IZHAvWHEdgdUwGckloFGycHpvikij05YNMHCOXHC6h1U92GsfcdY1
	gFrTUFUaUDiv+59pqPTF/OGoRUINug/8=
X-Received: by 2002:a17:902:ce8c:b0:2d6:2901:6265 with SMTP id d9443c01a7336-2d6dcaddacfmr124084805ad.2.1787660714335;
        Tue, 25 Aug 2026 05:25:14 -0700 (PDT)
X-Received: by 2002:a17:902:ce8c:b0:2d6:2901:6265 with SMTP id d9443c01a7336-2d6dcaddacfmr124083815ad.2.1787660713917;
        Tue, 25 Aug 2026 05:25:13 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768ba291sm27562625ad.64.2026.08.25.05.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:25:13 -0700 (PDT)
Message-ID: <ff0c8c22-bd37-451f-80bb-35389ba162c6@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 17:55:05 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
 <01cd0d90-2908-42cb-9ae8-29828d4c03a0@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <01cd0d90-2908-42cb-9ae8-29828d4c03a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AuiL0C1ZSYFPUAOl_5UNzel43_lH4Jx7
X-Proofpoint-GUID: AuiL0C1ZSYFPUAOl_5UNzel43_lH4Jx7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEwNSBTYWx0ZWRfX10AcFIJj9v30
 syeqnmiOqcaZkkTXnkCTGPJokTBazc3iq2mt9UAcDcu6ntWGcP/aK2xdSvx+cDyJrEPHdDaPmOy
 utK+KebjeR4SOd21M4bFkDkeOM3ZGLI=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d89ab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ctB7yVnqyLGUopViubUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEwNSBTYWx0ZWRfX/xI/lTB0uA1X
 I75EYd5iMnXP0uUrI2dHtqL74dWg+IjZ/GF5bFSwdkOPY8yES9IH2RBjMvpVpSFhCPKRQyg7a21
 97t3Jlqrh2bYJUE5ovcAqXdw5fINl/RC76tAtIfYesbOQGAaN9fCFHk4/hCYkDkI0ExnL1NUU5x
 LZmufgyb8LkBlkmI14AOggMi+JHXAEnhpJTBnFJXHRa/0gJdtpRMADXgqOuV15l3JMqWAExkLNe
 4b2tFTl+A9rtYPjkXAjdhQ3aLmognOF7pOR6EnugZJKOCj2ffPM/4fvsbG0FoUvCJBR/Ia0qJFn
 cmVW4RzF93AFWWKCX4URwj013W/3gY07yDcUk5LADbKbdbwvnWd5XK0A+zFCiAIIJQUqLUzBqzp
 nWHCE6HjYcUPXnmjcHWD0RftT3DmnKcqUKt3+yKIY2StCTsk+16yHQas1YVVUY1vHCGpfDU1nOJ
 a8tasDvuZTiRDgMMitw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250105



On 8/24/2026 7:49 PM, Konrad Dybcio wrote:
> On 8/9/26 2:29 PM, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in monaco.
> 
> [...]
> 
>>   		nsp-0-0-0-thermal {
>> +			polling-delay-passive = <200>;
> 
> ..and here it's 200 - I really think there should be a single value
> that makes sense, this seems no less than random

Thanks for the review, Konrad.

All targets added in this series use polling-delay-passive = <200> 
except Lemans, where the DTS already has polling-delay-passive = <10>. 
This series only adds the cooling maps there.

As per internal profiling, 200 ms was chosen for remoteproc/QMI-based 
cooling. I can send a separate follow-up patch to normalize Lemans to 
200 ms as well.

> 
> Konrad

