Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182E2E426A
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849389; cv=none; b=N2bYv+xwO8sTf+DKaQcq5HZ44NGJz0RREQddYIRUSlNtAjVaVUu1yi/XU9hY7njkaHcfFRXgCQJTOHjF/dH356lhJ5fMjwrg1y0e1Kugsvs+YgA+x2CWSgeEdkitble3Vw7Caa1Px4Ys+E5ddxz9PKXK6YQ8gxrqJaXdV5i6YWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849389; c=relaxed/simple;
	bh=sHOs0GTYF6MYZzkAUKdAEyFSOLHdPyOfDHBdqaWR/vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcIgDhrL2paL7mJg5p0CG9HIC/FigIZysjN7GpxbSVlCMKOvqbIfu3NvBGZ0VnA8hPDrwH2e5sU/DIkNc5Efhly6R4jF6diBn9K9AKxswYGdHglvU/Ewe0Hno6i+j2HE27vh+5wTtbjArKhnNtHvMEBHavGHXHRBulDNYWgmOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YK1Pt8v4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YK1Pt8v4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uSk1018790
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 07:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxjEsGRVWBXmL4+Xk2TjpeP1dlOSunr5SAVA0TMBdcQ=; b=YK1Pt8v4CmNEOxY1
	5rkw7T8qYAduyb8S3n5VarGLRc5e1xCiAkiYG++dYinwK29QTp9lRHqh/4mtx0IV
	wFyD52mS5Lq11jNen0R37GSFoy+9rONhBs49Bv/825YKOY3IAhSMFrClwEfhcR81
	8pDQgr3RX/snLfs5TJ1lSEDsAmK7Orr8bDwxDwl0R8sS3HUSxebAmDGTsFtNvna7
	SCe/wIvQVd1JcX5au/diYhJQIFaVH96fK5aA6IdWl/WFFwKUBYv0I5rHLHIrP/bi
	yZ6fOTMbNxFQPlB8NaAluOlkTUGWfVuljXHyjhfB+FWiEHjOKLgCUMRmV1rOpvvF
	IveGUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b07q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 07:56:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e60221fso3953205b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 00:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755849385; x=1756454185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxjEsGRVWBXmL4+Xk2TjpeP1dlOSunr5SAVA0TMBdcQ=;
        b=tFWNjC8c3aaAEwBzGWt2Gjc5r5O1ABSIPEMuGHOoy3Ngn4oW6oA7jgx4U3ORYl6bDN
         E1I6HKYQ2aHHQ0NQsJXH8ZO9/b5/QCrvYkvzZnO6k5L9mQ6bTiMc8F9Q2b5Ct8Ao4AJu
         v/riaYvrsO5CRWzBGOQO8eC6PwyBxnhoyPL8K2iV0XSO+1+8Vge6HWJ2EOMKmNxpjCdC
         OSj0mJB2l0pWNG2MKfy/vonkRq0l9UrTp5HemeRSkvosBtJPmeV9wakN5ElpfNSU2IsH
         TWMxQ1MrKbgHSc2p73oo4cqarM+bF7OKTOu/uAbgOk0iK2Pvm7F9nAQwWSgn+PYCfia3
         T2yg==
X-Forwarded-Encrypted: i=1; AJvYcCWdKDtZaRiWZnme//h5eEFdM4arYxU58U2ylfuLuh71+KjZCV+7bqVUXFPaBlN94iVJvYged7/1dsJyF4YzLvZC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8SRw/274JTsDkBCMLQC5jq9zbkrUY/YMrBcq7tiFlvFyujhU
	uKZlSBmmy4TMFJPD0w1dL0MP0WRAlCejTEd+CXvjWdWMV6Xrkh9y0UkPnqBpB0PkG6uwMpqZ9X7
	4hMA0r8o7Puf1Qk1h7uKNFVrfNPYSqe0pb7elJT9NlUC63R0oF3tTgW+9UTyAQdqu4zhFDRKf
X-Gm-Gg: ASbGncvvpo3GBWb66bvrWuRaeu7mmMmkBkE+gfY5lGzPKo0OLMhW1C96EVXbexVOFmv
	Mcb8Zocd8lXLWw4iEjh5mZEtDxtUnbNjNodkn0tT6wSE0Qaj06BHm1gRhzhbANpwFUD9mKJfdvC
	KdfXv7w4zZAmC2512TA8maP2MgOoIgwBkoiPEx/tI1y9UTY4wG5949XHlBzL098llT4NSC8qGkh
	WiEnYbQTuJogvJDJyKBX40933S3v1LpWNaI7gycmBnlfGB2C7od2+IyVttzU/cYQ8sjm0okQboA
	LlLyeAkN5ohPvUGxEGipAOLdw/coFcWXZFB1RYzclHm0LAGO/Jo55q06fMoCW3APCJw=
X-Received: by 2002:aa7:88c5:0:b0:746:24c9:c92e with SMTP id d2e1a72fcca58-7702fa049a1mr3022775b3a.8.1755849385261;
        Fri, 22 Aug 2025 00:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMF01Mr6+dT2+CUQCN5miP9hd+BEDxJ7nvMcybVotwEZ27yWMtV1Jc5BCjDAR+i/MtiI/QbA==
X-Received: by 2002:aa7:88c5:0:b0:746:24c9:c92e with SMTP id d2e1a72fcca58-7702fa049a1mr3022741b3a.8.1755849384749;
        Fri, 22 Aug 2025 00:56:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d22e9sm10407083b3a.8.2025.08.22.00.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:56:24 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:26:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <20250822075618.hwiwfs6fjdxgaecs@hu-mojha-hyd.qualcomm.com>
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
 <aKXqSU-487b6Je2B@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKXqSU-487b6Je2B@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/g4ZFpALGnKE
 sT46YDR6wWTTduehG+Lv+UNsWGz2aNrFW68rwzW8L2QNPwqZ/dz8KlnUlTgYQNRT09VINQ5++VQ
 I/UvBVbNerJ/zM49N90QCFZiomomJ8993/ZNo2WeBu2CtGIgUVHZZKML1PrAx34qlwbooQxJmk1
 TAESeJQ7Ei40dQWa9T7m6kLzI/mDRY1ggHBw5IE44+agFaVsRxL+AsqnPJprUxjoSvKfym62Znv
 so7FLjk3HroOQdOwhDkZhp54QF+7ibLMXnzi/oFxWqU/aTTXooA7IOigHvArtsp58ukmJHOU0Kx
 D5fxcfdhJS+SKi/0MI4ROfa5SACQrqIKb2achUl3uR7FfBhOrwvVBrIv0CBWoueDOgWO43u0ewd
 QhO1qozKDEUZglwX22/SxjKrpoYQ5A==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a822aa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=mFb6QbOdW2Rl2U-Ib8IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2hJJAPXxWvSEXh4PmLr-8qjrVQ5-ABhH
X-Proofpoint-GUID: 2hJJAPXxWvSEXh4PmLr-8qjrVQ5-ABhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:31:21PM +0200, Stephan Gerhold wrote:
> On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> > On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > > The resource table data structure has traditionally been associated with
> > > > the remoteproc framework, where the resource table is included as a
> > > > section within the remote processor firmware binary. However, it is also
> > > > possible to obtain the resource table through other means—such as from a
> > > > reserved memory region populated by the boot firmware, statically
> > > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > > in the firmware.
> > > > 
> > > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > > manage their lifecycle for various reasons.
> > > > 
> > > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > > also want to use the resource table SMC call to retrieve and map
> > > > resources before they are used by the remote processor.
> > > > 
> > > 
> > > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > > support already for older platforms:
> > 
> > Example was taken from perspective of remote processor life-cycle management.
> > You are right they have worked before in non-secure way for Chrome.
> > 
> > > 
> > >  - For GPU, we just skip loading the ZAP shader and access the protected
> > >    registers directly. I would expect the ZAP shader does effectively
> > >    the same, perhaps with some additional handling for secure mode. Is
> > >    this even a real remote processor that has a separate IOMMU domain?
> > > 
> > 
> > I don't think it is the case and think the same that they can skip
> > loading and Hence, I have not yet added support for it.
> > 
> > Will check internally before doing anything on GPU.
> > 
> > >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> > >    that maps the firmware with the IOMMU (but invokes reset directly
> > >    using the registers, without using PAS). There is no resource table
> > >    used for that either, so at least all Venus/Iris versions so far
> > >    apparently had no need for any mappings aside from the firmware
> > >    binary.
> > 
> > You are absolutely right
> > 
> > > 
> > > I understand that you want to continue using PAS for these, but I'm a
> > > bit confused what kind of mappings we would expect to have in the
> > > resource table for video and GPU. Could you give an example?
> > 
> > We have some debug hw tracing available for video for lemans, which is
> > optional However, I believe infra is good to have incase we need some
> > required resources to be map for Video to work for a SoC.
> > 
> 
> Thanks for the clarification.
> 
> Personally, I'm a bit concerned about the code duplication in PATCH
> 08/11, I think parsing the resource table should ideally be code shared
> between the remoteproc subsystem and whereever else you need it. The way
> you parse it and handle the IOMMU mappings is largely the same, you just
> don't support all of the resource table functionality. Have you checked
> if sharing the code would be feasible?
> 
> If there is no upstream requirement for this right now, you might want
> to consider handling this in a follow up series, after you get the
> required functionality in. This would reduce the amount of changes in
> your series quite a bit.

Yes, there is duplication in the parsing and I initially given a thought
to do it but dropped temporarily if we are open for such changes in rproc
framework and I even have a doubt about 6/11 if it is fine or not just
because there is user who does not care about remoteproc framework but
worried about resources.

I agree, it will be good if we do separation of resource table related code
from remoteproc framework so that the code can be shared but doubtful
whether it should be done as part of series or and can be followed
separately.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha
