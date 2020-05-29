Return-Path: <SRS0=N1Fc=7L=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117C0C433E2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 May 2020 06:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF9B6212CC
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 May 2020 06:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HP/Hr9Ta"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgE2GCJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 May 2020 02:02:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44035 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725928AbgE2GCI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 May 2020 02:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590732127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ffiZE6g18lngbbpjo1gUPeKuc7C2D+JU9iaxsPoeJj8=;
        b=HP/Hr9Tazy/MZxV67qQr34JMcpq4erwjk+1a3j+sVgLTURXgdrZM4CecwiQUpLYDpvJ3DY
        YRIxn7jnk5FvbIDPLPF7eFI2cShfREnBx1E02DTbTtQurfIrhl9/NkSkVK1re5yOpe9JQz
        Eu0WeQQF4LpbmwUjkkL5rbq21J0FAU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-6lfzZSWOMTejw0vtJNWU-w-1; Fri, 29 May 2020 02:02:03 -0400
X-MC-Unique: 6lfzZSWOMTejw0vtJNWU-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E2E9460;
        Fri, 29 May 2020 06:02:02 +0000 (UTC)
Received: from [10.72.13.231] (ovpn-13-231.pek2.redhat.com [10.72.13.231])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3F68210013DB;
        Fri, 29 May 2020 06:01:54 +0000 (UTC)
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        kvm@vger.kernel.org
Cc:     linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <044a3b81-e0fd-5d96-80ff-b13e587f9d39@redhat.com>
Date:   Fri, 29 May 2020 14:01:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 2020/5/28 上午2:05, Guennadi Liakhovetski wrote:
> v3:
> - address several checkpatch warnings
> - address comments from Mathieu Poirier
>
> v2:
> - update patch #5 with a correct vhost_dev_init() prototype
> - drop patch #6 - it depends on a different patch, that is currently
>    an RFC
> - address comments from Pierre-Louis Bossart:
>    * remove "default n" from Kconfig
>
> Linux supports RPMsg over VirtIO for "remote processor" /AMP use
> cases. It can however also be used for virtualisation scenarios,
> e.g. when using KVM to run Linux on both the host and the guests.
> This patch set adds a wrapper API to facilitate writing vhost
> drivers for such RPMsg-based solutions. The first use case is an
> audio DSP virtualisation project, currently under development, ready
> for review and submission, available at
> https://github.com/thesofproject/linux/pull/1501/commits
> A further patch for the ADSP vhost RPMsg driver will be sent
> separately for review only since it cannot be merged without audio
> patches being upstreamed first.


Hi:

It would be hard to evaluate this series without a real user. So if 
possible, I suggest to post the actual user for vhost rpmsg API.

Thanks


>
> Thanks
> Guennadi

