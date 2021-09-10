Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425BFC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 16:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16EDC611C7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 16:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhIJQlQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 12:41:16 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:43944 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230328AbhIJQlQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 12:41:16 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18A9YPhT030668;
        Fri, 10 Sep 2021 18:39:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sC/T97Aos4kjVqrR5NQYyImnWuZMntqt0EqkidBKWbc=;
 b=0V2qafOD2CiPKjYjTOTjxXc34j85f5ujdnf7A4J3BoAFcuT+SvFVaEtEgLRbUsABP/EW
 sgoWU3Mufacq5HMK2DmISE70PZRT1+eqnOYiRJSuVhU/ncvhoPYqcFVprYQ+RgonUUxY
 Q1byLr0EHj1tQofIoxfnnEHwf4/pBUyF2acAujosq8dgZ3QXpvKhTWHzvHaWMf9D9J9p
 vuhRsz1x17GgiIo+86lnho2yht4O84SA0k2NxXBOfTjrKnrwdI2FKLFbx8f1tC9FjSGp
 Iptl60DyPU+EMi02iOB0EcHVEtJR63AcUitGmJ7IN5cNjZhniGsNN3CUAH5Zn/scUZfZ sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3b04ur1x5w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Sep 2021 18:39:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACE9910002A;
        Fri, 10 Sep 2021 18:39:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91FF02248C3;
        Fri, 10 Sep 2021 18:39:54 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG1NODE2.st.com
 (10.75.127.2) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Sep
 2021 18:39:53 +0200
Subject: Re: [GIT PULL] remoteproc updates for v5.15
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        Alex Elder <elder@linaro.org>,
        "Linus Torvalds" <torvalds@linux-foundation.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>
References: <20210907140023.2399178-1-bjorn.andersson@linaro.org>
 <d689501f-87d3-59ef-0c04-69b1f5029cc9@foss.st.com> <YTtyxSHdBpFpM6ra@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <aa564260-61c2-e6ee-4b86-4689b84bfc02@foss.st.com>
Date:   Fri, 10 Sep 2021 18:39:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTtyxSHdBpFpM6ra@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG1NODE2.st.com
 (10.75.127.2)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_06,2021-09-09_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/10/21 4:59 PM, Bjorn Andersson wrote:
> On Fri 10 Sep 06:32 PDT 2021, Arnaud POULIQUEN wrote:
> 
>> Hello Bjorn,
>>
> 
> Good morning Arnaud,
> 
>>
>> On 9/7/21 4:00 PM, Bjorn Andersson wrote:
>>> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
>>>
>>>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.15
>>>
>>> for you to fetch changes up to a0a77028c85ad1f6f36c3ceea21b30dc43721665:
>>>
>>>   remoteproc: q6v5_pas: Add sdm660 ADSP PIL compatible (2021-08-04 12:37:32 -0500)
>>>
>>> ----------------------------------------------------------------
>>> remoteproc updates for v5.15
>>>
>>
>> I was expecting to see a pull request for the RPMsg framework as well,
>> integrating my work around the rpmsg_char driver restructuring.
>>
>> These series listed at the end of my mail have been reviewed by Mathieu Poirier
>> (RPMsg framework co-maintainer) before the 5.14 pull requests. Then on July 12,
>> I re-based the series on v14.1-rc1 expecting to give you enough time to
>> integrate them for the next 5.15 merge window.
>>
> 
> Yes, I definitely had enough time.
> 
>> Could you please tell me if it is just a miss or if you have some concerns on
>> them? Because I never received feedback from you for this work.
>>
> 
> I did see that you and Mathieu had reached an agreement on the patches
> and set out to apply the patches.
> 
> But as I look at the patches I realize that you're refactoring the
> entire design of how rpmsg_char works and last time we spoke about the
> existing users I got the feeling that you had no way to validate that
> they still work after this refactoring. And in those discussions I
> highlighted a few things that would break existing users.
> 
> So I felt the need to convince myself that your series does indeed not
> break existing users.

I understand, Mathieu and I have kept in mind this compatibility. I think we
maintain the legacy. But yes, agree with you that a non regression test using
the Qcom drivers is important to ensure that.

> 
> Unfortunately I dropped the ball on getting back to do this.
> 
>> Or maybe I missed something in the process, I thought that Matthieu's
>> "reviewed-by" was sufficient to be accepted.
>>
> 
> The change is complex, affects existing users, it introduces new ABI and
> that I don't believe Mathieu has the means of testing the existing
> users(?). So while I trust Mathieu's R-b, I did want to take one more
> look at it.
> 
>> How could we move forward on this work, which also seems to interest some other
>> companies?
>>
> 
> I'll make sure to carve out the necessary time in the coming days to go
> through the patches and let's take it from there.
> 
>> Related series:
>> - [PATCH v5 0/4] Restructure the rpmsg char to decorrelate the control part
>>   https://lkml.org/lkml/2021/7/12/2872
>> - [PATCH v4 0/4] rpmsg: char: introduce the rpmsg-raw channel???
>>   https://lkml.org/lkml/2021/7/12/2908
>> - [PATCH v3] rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
>>   https://lkml.org/lkml/2021/7/12/2913
>>
> 
> You have 9 patches over 3 different series in different versions, where
> things certainly depend on each other.
> 
> I believe I asked you if we could do this step-wise, I didn't mean that
> we should split it in multiple steps that needs to be taken at the same
> time...

This split is coming during review discussions with Mathieu, to ease the
reviews. So versions depend on series reviews iteration.
But it is not necessary to get them in one package "just" to respect dependencies.

Here is the order you have to respect:

1) [PATCH v5 0/4] Restructure the rpmsg char to decorrelate the control part
=> first patch that impact rpmsg_char client drivers.
minor impact but right, not tested on Qcom platform (only build testd for Qcom
drivers)

2) [PATCH v4 0/4] rpmsg: char: introduce the rpmsg-raw channel
As described in the cover letter to be applied on top of:
[PATCH v5 0/4] Restructure the rpmsg char to decorrelate the control part
=> tested by  Julien Massot from iot.bzh

3) [PATCH v3] rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
To apply on top of the two previous ones.

So either you can integrate and test them one by one, or i can squash them in a
new series if this can simplify your integration.

In any cases, just send me an email if you need patch-sets refactoring, or
clarification on some points.


>> - [PATCH v2] rpmsg: Fix rpmsg_create_ept return when RPMSG config is not defined
>>   https://lkml.org/lkml/2021/7/12/2877
> 
> Then you have this, which I thought was related to the others when I
> browsed through the patch list, and therefor didn't merge. But now that
> I look again I see that this is unrelated.
> 
> I've added the appropriate Fixes tag and picked this up now.

Correct independent patch, thanks for the patch update.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Thanks in advance,
>> Regards,
>> Arnaud
>>
>>
>>> This moves the crash recovery worker to the freezable work queue to
>>> avoid interaction with other drivers during suspend & resume. It fixes a
>>> couple of typos in comments.
>>>
>>> It adds support for handling the audio DSP on SDM660 and it fixes a race
>>> between the Qualcomm wireless subsystem driver and the associated driver
>>> for the RF chip.
>>>
>>> ----------------------------------------------------------------
>>> Alex Elder (1):
>>>       remoteproc: use freezable workqueue for crash notifications
>>>
>>> Bjorn Andersson (1):
>>>       remoteproc: qcom: wcnss: Fix race with iris probe
>>>
>>> Dong Aisheng (2):
>>>       remoteproc: fix an typo in fw_elf_get_class code comments
>>>       remoteproc: fix kernel doc for struct rproc_ops
>>>
>>> Konrad Dybcio (2):
>>>       dt-bindings: remoteproc: qcom: adsp: Add SDM660 ADSP
>>>       remoteproc: q6v5_pas: Add sdm660 ADSP PIL compatible
>>>
>>>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   1 +
>>>  drivers/remoteproc/qcom_q6v5_pas.c                 |   1 +
>>>  drivers/remoteproc/qcom_wcnss.c                    |  49 +++------
>>>  drivers/remoteproc/qcom_wcnss.h                    |   4 +-
>>>  drivers/remoteproc/qcom_wcnss_iris.c               | 120 +++++++++++++--------
>>>  drivers/remoteproc/remoteproc_core.c               |   4 +-
>>>  drivers/remoteproc/remoteproc_elf_helpers.h        |   2 +-
>>>  include/linux/remoteproc.h                         |   5 +-
>>>  8 files changed, 96 insertions(+), 90 deletions(-)
>>>
