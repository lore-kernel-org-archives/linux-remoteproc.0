Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7144D3254A8
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366480; cv=none; b=DE4Pf/c6ID14MH9+tq5VW+cYVB0wBgRe8OH/NyZ3GkNoVLkxAu54xui3B+CoybkxLHIQ+3x3embZh0rDh6hzfWYy8UiGAR0eVGYdF7pWwxRXXUCfeWzufZoautkizFzn+AXv2IfXReu/n0y9rZPSNQidfNOeY7AgVcJVBozNl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366480; c=relaxed/simple;
	bh=G5bzsqL7CD6Jj6kiG9Oe7kbdaoiW/kRUDknhNrluwK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjEgobEUc+2Z+F8tlbSQ7S0wXk5Yhq742DK9vKs9K3cvfOe8+rSfuKpInAX/4T2Y8/mKVWT0vTF/nJNqOQmJTwlVIIBnLSr5lLvhUu/fmOs5eicFr3TYlj2z2Ki2BHBwb0rMTqIdNuhAgnnHOTlWNM7MO/4jv9feDpgyMV13YHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtDnMNsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvoITfgN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtDnMNsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvoITfgN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFNCU810177
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 19:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6DHjZemGZbGTGMEMZvfJ4XTU
	0d57xnMw3yNqcpZYiWM=; b=DtDnMNsBzHzC0TD4SHYPpX48Eo/CijmqywYKbORt
	vnFqEQUjKUySGwVuaSb5s/rwLCbjhpvJ5mkLUG8yaHWJ+8rMX6JhQvmji6K33H7G
	rNe5eDeQL5l6fsGjTLT/4htEzkKJj79G8cQHMKDD0XtuTrJLaOXcrwXNVD+r7Uvk
	FSqeeeqO86TZIxTnOxFHaKRXIBABkkhQkI9imCDPkIerqLKJCwgvny/HCoLX/owG
	3uySDKT+8nvXyKA44v/2FeUXwvvjDyHb7V06WmewVVRq64CN7T2IsdOsDTZFfACW
	ZNeJrRT9BCkqRAuLx1bI1xmdFRN2BQaVjGI9/JvYHw9VRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsb220-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 19:34:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso360987785a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366477; x=1783971277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DHjZemGZbGTGMEMZvfJ4XTU0d57xnMw3yNqcpZYiWM=;
        b=XvoITfgNBDYYrbRyB4XXXMficpoMSqgqSJ0FYVZTxtvC8ZMTSjH9n2uiTqJws/F8kl
         /ppgtVzFhTeOm4yM4UzchyqacCbCSzG4Gg8q+Obut30KoVhNtAVb5BfnUdqUuNnfmivO
         r4TwNkhFL96EO9DtweC1uNLNddde8EgUyvM+RaRBoo/ntyuF3mx1+gG6Q63FgAyZhejy
         FxcHfHbTt4MyAAHyM3EHagmlY6B2jGv1leTy50+y/gDzzBI9BKpGEbUN4ob0/JgYCKAX
         4t18kmClfJKER2iS0dRfTths1Lf8eIqtfiesdaW1awvuvwamnbGeIX0jc0AcEkfqbNH6
         SzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366477; x=1783971277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DHjZemGZbGTGMEMZvfJ4XTU0d57xnMw3yNqcpZYiWM=;
        b=YEHmIpPY5FPzuK6SvtbFCc2gXP4uix6V4GWg34L4tz0AnZspxFQZjJhAIjk8HD7Nia
         ufSqSgpPsPSH36+j8d9iION8TDZQXpMvat55RpwTg7VUmCy2RY8Vrr502c4mlkR0IH5s
         GFzZmTb1+RCStB65VumrJnAWfDJxU1ODA2Da3ummBjQrk5MFi4H632jgBKXgRgL4Bpd2
         0JLaNTfowdvWq7blp8hxKWM3zhZZPqoXXujHzWitfU5fRq3pgjoKNj/HkGLLFpQOe8VW
         /vyHdc4v982oL2K4bLwtvLzF5wIxVl18Fl9bPHxoWH8h0710/upF1hBvA1ii1tlvQTN0
         Qhag==
X-Forwarded-Encrypted: i=1; AHgh+RpgFWWtmjn/BLk7HV3eA56aOZgaibhf3tWR0u6Bxi8ITY/jgt9LeJ8Kg3kNeP7PMrnzEpcB1LTOCK3uKUnbg2r1@vger.kernel.org
X-Gm-Message-State: AOJu0YzmHSqFg5evhCkpqCSOEJdToE0qj7wghJwy0BL0Z+6QDnavyixP
	Pe1v6rflpMKsVemrPtBIUwP8dIryv9ogSrOf2oFpjCcoZV9hJPf/SimyssM4bDEW6siFylCUkyP
	9J/nOt+DzU8sL/oea/ooBnmt26/DFXXlrrDUAMR2RZPnTVKREHMj1QC7wR0WxrpQ0sZYOUb9S
X-Gm-Gg: AfdE7cl7o6sjrz3/0bdH/nML4EB61qoa+R4eFJSWtpr1JbQQzjjtDwjn+A6cajQ5bvM
	cAjujubl5m7725OqaEKagbDfLb5/34/yB6UZJUbYqtCiwYuB9HOrtZVLarHZsW6ES6LpTqnUiEG
	711Rr9UdbT2F4+xpqxJ+tmsxebQFH2B+mgGAuKd6jl+whDByEGTC4gMPtm7s9ocI/lBeqTiUwmL
	1IfraW8mtDd9UIP4I/28uwIb85RlbpMmYjDXy2tG0MoSbMZGSqtOncRPtzZT+3EbrWzFWH1Laka
	6vd+DS2vESgv4MrDky4DdC58WbeGtFjUWjakyK4b6oMlnxA3KsfrMzNzQw0cynEOUtSuhphrjiR
	kvxOS53tG4bftYSZpOlM7dHP8bXtuCL2F74ngi13scaPUdMIW4clVDQYH6QRTASjTTioCJdtwMM
	x9gKfkEgEWzdTNGAAaZ/ZaDGlC
X-Received: by 2002:a05:620a:6011:b0:92e:59b0:df08 with SMTP id af79cd13be357-92ebb4c1058mr311310385a.3.1783366476646;
        Mon, 06 Jul 2026 12:34:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:92e:59b0:df08 with SMTP id af79cd13be357-92ebb4c1058mr311304285a.3.1783366475990;
        Mon, 06 Jul 2026 12:34:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c63ce4e57sm1325031fa.31.2026.07.06.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:34:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: M7S0c_OiT6TeCPRDYfumXKRzkLPCqqhR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfXx7MO2WzW1hJp
 kcOJlzJh4EWpkBJ+qPen1HFKe+I/qZSG6SRdtaSoRAhLWzUkfDebBDiFH7Sez3Di95UyCogh3f8
 X4Fo6AMTr5EQQj4f2DzR3l+fprcgKGvfaNzaXd/AriPMwLzl0qaeH902ZnP3nQsnCXj3YOaHCD2
 p7GbP7PP9DVu7YYbkUM1UfdD/Nl4Y8OVDtRDLMyYCz786AZFQO7rvKcUDCHfAqZC5Ius8GXKOjU
 vkP/CrzclIWGIr01q2WrACulBJxBXZkybf/SWO+4H0TJaoMgbPWDEt/738z5dYgM2moFH6KbSiX
 wvNYH4AgOyMi8XPIG1lbmbk5r1LhxtxajhNGftbUucpY4A/G6rkyB+ewiRH6kmyKQgrNNEX8qEn
 GhLUQaho/bHgNOQyMUnC9eJ/CTh7AkaWlbVZFwPWGcG4MJ7QBPwrdGklY6LVWAyu+JEziNnyx/t
 jTB6SnKTTpHYn+wEQbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX98xTBH7FIoNB
 jMBZ6Fpphyi0yBToNnANJ++28hZXvnSuMReJjJ7UuncZMntFjnJLoANoLvTVMuAAybR8uxjUuPB
 w84IisEW/aY6JpSDVvtQ/rmaVittH0I=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c034d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=AjCqL75dquvNJiF6hoMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: M7S0c_OiT6TeCPRDYfumXKRzkLPCqqhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060197

On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
> On 7/6/26 19:47, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> > > On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > > > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > > > 
> > > > > 
> > > > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > > > 
> > > > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > > > through QMI. These endpoints can be registered with the thermal
> > > > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > > > 
> > > > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > > > 
> > > > > > >      <&phandle device_id min_state max_state>
> > > > > > > 
> > > > > > > Define common TMD device index constants shared across currently
> > > > > > > supported platforms. If a future target requires a different mapping,
> > > > > > > additional target-specific constants can be introduced while preserving
> > > > > > > existing DT ABI.
> > > > > > > 
> > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> [ ... ]
> 
> > > > Why are you using only those TMD devices?
> > > > 
> > > > > More constants can be added as needed.
> > > > 
> > > > Kodiak is one of the supported platforms.
> > > 
> > > What would be the benefit of having more than thirteen cooling devices
> > > declared in the thermal framework and having only a couple of them mapped in
> > > a thermal zone ?
> > > 
> > > I agree there are more TMDs but if they are unused for the moment, why do we
> > > need to add them ? Can we do that incrementally ?
> > 
> > That's what I am trying to understand: why the implementation uses only
> > the selected two devices, if the modem on Kodiak supports others. How
> > can we find out, which TMDs to use on other devices.
> 
> My understanding is that is an initial thermal setup. Gaurav will add them
> step by step while setting up all the thermal zones instead of sending a big
> patchset. And TBH, that will be much easier to review.

In such a case it should be noted in the commit message and/or cover
letter.


-- 
With best wishes
Dmitry
