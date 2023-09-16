Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DEFCD37B0
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Sep 2023 01:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbjIPBix (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Sep 2023 21:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236002AbjIPBil (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Sep 2023 21:38:41 -0400
Received: from klingt.org (mail.klingt.org [86.59.21.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F0E1BF0
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Sep 2023 18:38:35 -0700 (PDT)
Received: from [192.168.0.106] ([202.184.201.145])
        (authenticated bits=0)
        by klingt.org (8.17.2/8.17.2/Debian-1) with ESMTPSA id 38G1cMQP1114024
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Sat, 16 Sep 2023 03:38:23 +0200
Message-ID: <862d369b-4f6d-f64c-ffa3-fb7740df42cb@klingt.org>
Date:   Sat, 16 Sep 2023 09:38:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Content-Language: en-US
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        =?UTF-8?Q?Agosti=c3=b1o_Carballeira?= 
        <agostino.carballeira@native-instruments.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tim Blechmann <tim.blechmann@gmail.com>,
        linux-remoteproc@vger.kernel.org
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
 <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
 <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
 <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
 <d2a303ad-4dcf-de52-38db-53695169fe33@klingt.org>
 <d37a0431-9b4d-1215-2c2c-14c8963f93a7@foss.st.com>
 <117fbe3c-3db4-4f82-1d96-11501259e209@klingt.org>
 <CAG2LOc42AG5H56=tzz8_2WrrBiy9d74qYmgPQaEVGrzWTNqodg@mail.gmail.com>
 <12d59a09-bb83-26e7-321e-1407b3f814e8@foss.st.com>
From:   Tim Blechmann <tim@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
In-Reply-To: <12d59a09-bb83-26e7-321e-1407b3f814e8@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: inspected by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Sat, 16 Sep 2023 03:38:25 +0200 (CEST) for IP:'202.184.201.145' DOMAIN:'[202.184.201.145]' HELO:'[192.168.0.106]' FROM:'tim@klingt.org' RCPT:''
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Sat, 16 Sep 2023 03:38:25 +0200 (CEST)
X-Virus-Scanned: clamav-milter 1.0.3 at es.klingt.org
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

>> Interestingly, when we replace rpmsg_send by rpmsg_trysend + busywait loop, this
>> mutual stall doesn't happen at all.
> 
> What do you mean by busywait? Do you add a delay between 2 rpmsg_trysend()
> calls? If yes, you probably add delay that avoid the issue.
> 
> That said rpmsg_trysend is recommended for baremetal to avoid to block the system.

to avoid misunderstanding here: replacing `rpmsg_send` by a 
`rpmsg_trysend` / `usleep` loop on the *linux* side works around the 
issue (i.e. in our own small module and in rpmsg_char).

thanks,
tim
