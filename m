Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59708322765
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707581; cv=none; b=kz0fnmpd/zYIEPl/ozaQYIyYuz1YD3L1Fj3LaNQNyrzrTt97VSogDa5aQXqxfiFcNcVTCCbqOdXmCWXGTlaICZfw5hmhasasqQhCmHKDcNgkK0jDLhgvxrbp9hJ4TXc5bfNde0x4T9VBCIuk0P7hT87wBY2tLaw8MBjvpsf/zp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707581; c=relaxed/simple;
	bh=ek1uZRR3yVQREq8MktmJCRi7FBsB8kVi1MTlISfhc9c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgqWBmmOK2ho0LgH8HTlnpAne93ESvkLDXm45ItVj+dndr70LXf/h6fnNUJsnGTRW+h7lMLRHgpSMi/d2gn5O/Hd52ley3AiL6nTinKvnC8fsvW4wVNzIslk0Bpo1AYUI1piiwqR85OfrduWzfLHNCi02fDPHqMQkwYITaIB2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQVZFyf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQVZFyf6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA64fq006121
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 16:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJpU55n6EWwcBk2mRT86w2Qmc2jh1ppOl8Thz+35/TA=; b=pQVZFyf6njDKvkqR
	/HiMQzmPurRbgDPF0+Ah6V3My3vEkp7N9E0mzyi8bPQV9UcMh6a9Vrud/x9aBZif
	Vo08YEkLpV21rHja6n9fdegiigULS85prsT7gW2TDlKvNvtLTMTkBYaxX1+OhTta
	1DnwDbgTA3tPIyYl0rwjOG3ZF3AjStx9O0munHvh7w3lQwT5vnazmfG3/IW2JOpZ
	RffjO23BomWdJ7/3S8VQZro5FxHIo5cImcbp6UU5L/Iy5N6I1lN/8SB9FjRdLZJB
	i8E1VquO1MsyXteTaEzF1zVanT5CRAzf0fVva8dZTfF049ha1BoDaImVJlQJeqHg
	2pEeWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5292cg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 16:32:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-323266dcf3bso121313a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 09:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755707578; x=1756312378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJpU55n6EWwcBk2mRT86w2Qmc2jh1ppOl8Thz+35/TA=;
        b=GtDHVdlo2wNyrmK6Jo5yw7m7ViZdIyOcFhWGlSKYPi+iT5JDUnEnIm63Ijc6LSVUIL
         namXkrX9FYSgUBxaYQHn9l32wlh2H2Msw7jV2SOSg5YYBSklIgqPomAmqR5CcbqT2823
         kiPwRGlawE9Q50Tn918YzW+VK7lhYFagvxZoPrK8Hx5IWvxj4UFMKHde+I4HYhKRZtIf
         b/2MC+JC/iiw9/olCspK0Xz/hC6I3pDWzvdP7llIRecEYTlkuAVelbt0En7abimrBv0C
         zYru4xdRqx1XtXRheTYW/K0twsb8+5trrPcadUngni6JHKLhoFYhSgUQdyt3LEheBldg
         pOtw==
X-Forwarded-Encrypted: i=1; AJvYcCWctbJAVT9jsx+4b1rwR3fkUvePoFXQWa26al3HdCtzRcnjhNJm9vASraOR9rnYKe1hRukT/KhfEeK0ywQ5q6ou@vger.kernel.org
X-Gm-Message-State: AOJu0YwGK89+wBXtVmT26iafD4cWf0xOGpYyUNmTnvTGm7L1yPyv4JoA
	Nqgs8ggRsTRNw/n8/Q/thvcBKAHPvKZRWLyGN4BbQi0EmMJlhfeEzLIp6rPcl9jtY4yF590vQeh
	hwca/mjq5qgfQACe80NlIEF/bqhPgsKBVvvASkbLExDo0dgB9frqgetKK/WZuObZ01gpGFUkS
X-Gm-Gg: ASbGncvWvLklFvrtgYI6sX/1XUgSYTQqZouddbRySeLMs6iH7YTqbh3345jbI7Wq2ZI
	7sznzg1IQZATRPtsnCgw1bXHPZP7HBjc/m4exeNmSljno1qgNQFqcU4qHCcggZL1PG2gZY+Ow0G
	QqzzQi8sFpviO1ppXKSgubyS+dVzz7dpUDIe79MTyAMCyGSRMzSWOeCfUTlCppGakOXNPXPXSWW
	YdVFHuTvsaTpdRAe6MFhqstJGphJmSsCNMqxRBGnV0WE5s1Y1erD9Ph6WjINrAIB0zBd76yBpf1
	O1RNyXy/eUy+WhvaybG3entE6iXiQqTXc3KiGOyqyMXuLyQkXSABpRAxF44fLa6a8rE=
X-Received: by 2002:a17:90b:1d05:b0:321:87fa:e1f1 with SMTP id 98e67ed59e1d1-324e1420bffmr4083053a91.22.1755707577544;
        Wed, 20 Aug 2025 09:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH94fcQIM0EQQ4FOX9IB+jNU3oqMNrDLBrQ3XekIZjMt3ZLm2pAz1R8JGDpb1Pkzk/QqmZJFg==
X-Received: by 2002:a17:90b:1d05:b0:321:87fa:e1f1 with SMTP id 98e67ed59e1d1-324e1420bffmr4083013a91.22.1755707577028;
        Wed, 20 Aug 2025 09:32:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e254c74fsm2765675a91.13.2025.08.20.09.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:32:56 -0700 (PDT)
Date: Wed, 20 Aug 2025 22:02:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a5f8ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=9xhQPkZVqO5vzfdQ-C0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZP96WQ_fZf3FLGgGbSSARIcLp7MEaHVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9A35mg+d7IqH
 YanbEb0Ahn54ApwpcGvqaN2RMrsAXSh/LZnsmccdR/fbYARSPBfzNg3ITh7yjiEIkcSonAGxC46
 MtPbsAB4oOKjKbliZqOLwGpGQobbrE/eiAez/6rvaphOE9l5Sqyoc9yWRkIVP3jvZ9u+bVyMt65
 u1aSqlD2QkYRoJ9nhx4b6BdQJryNc8kGOoZeEVpupeZOHDo4tdZ9Dm4+LlV9b3c3opzgGrPGlE7
 b9tZNSNwzS3vFCGWPy42OYfAiLQwtRuN3PAx9Sk1t0Ig0EnfeX4eJcSYVjxD30yVqu9hYBatB91
 gJt8c7jg6Y9RMngVfnuRT9pp8OYOd4B57pdKBiylkVckubddm2083rsxJ6POHj5CTfCelqzVEiH
 hRx3R3XAYEuRNs4wxTGyz/OwJmfKjQ==
X-Proofpoint-GUID: ZP96WQ_fZf3FLGgGbSSARIcLp7MEaHVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > The resource table data structure has traditionally been associated with
> > > the remoteproc framework, where the resource table is included as a
> > > section within the remote processor firmware binary. However, it is also
> > > possible to obtain the resource table through other means—such as from a
> > > reserved memory region populated by the boot firmware, statically
> > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > in the firmware.
> > > 
> > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > manage their lifecycle for various reasons.
> > > 
> > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > also want to use the resource table SMC call to retrieve and map
> > > resources before they are used by the remote processor.
> > > 
> > 
> > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > support already for older platforms:
> 
> Example was taken from perspective of remote processor life-cycle management.
> You are right they have worked before in non-secure way for Chrome.
> 
> > 
> >  - For GPU, we just skip loading the ZAP shader and access the protected
> >    registers directly. I would expect the ZAP shader does effectively
> >    the same, perhaps with some additional handling for secure mode. Is
> >    this even a real remote processor that has a separate IOMMU domain?
> > 
> 
> I don't think it is the case and think the same that they can skip
> loading and Hence, I have not yet added support for it.
> 
> Will check internally before doing anything on GPU.
> 
> >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> >    that maps the firmware with the IOMMU (but invokes reset directly
> >    using the registers, without using PAS). There is no resource table
> >    used for that either, so at least all Venus/Iris versions so far
> >    apparently had no need for any mappings aside from the firmware
> >    binary.
> 
> You are absolutely right
> 
> > 
> > I understand that you want to continue using PAS for these, but I'm a
> > bit confused what kind of mappings we would expect to have in the
> > resource table for video and GPU. Could you give an example?
> 
> We have some debug hw tracing available for video for lemans, which is
> optional However, I believe infra is good to have incase we need some
> required resources to be map for Video to work for a SoC.
> 
> > 
> > Thanks,
> > Stephan
> 
> -- 
> -Mukesh Ojha

Since I am not subscribed to any of the mailing lists to which this
series was sent, I am not receiving emails from the list. As a result,
your recent messages did not reach my inbox. Additionally, it seems your
reply inadvertently removed me from the To-list.


https://lore.kernel.org/lkml/aKXqSU-487b6Je2B@linaro.org/

https://lore.kernel.org/lkml/aKXQAoXZyR6SRPAA@linaro.org/



-- 
-Mukesh Ojha
