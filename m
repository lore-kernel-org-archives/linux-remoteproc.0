Return-Path: <SRS0=DqHI=C6=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF737C43465
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 10:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9351B21D91
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 10:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgIUKFH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 06:05:07 -0400
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:45178 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIUKFG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 06:05:06 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 08LA4sWI014703; Mon, 21 Sep 2020 19:04:54 +0900
X-Iguazu-Qid: 2wHHyicD2oUdXY0YBE
X-Iguazu-QSIG: v=2; s=0; t=1600682694; q=2wHHyicD2oUdXY0YBE; m=jZGzzKb8LDRHKxB/VJLPNU+bvoPiRXNtmpMfOk08RqM=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1110) id 08LA4rMK036855;
        Mon, 21 Sep 2020 19:04:53 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 08LA4qDr021134;
        Mon, 21 Sep 2020 19:04:52 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 08LA4q2j030893;
        Mon, 21 Sep 2020 19:04:52 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     Wendy Liang <sunnyliangjy@gmail.com>,
        Michael Auchter <michael.auchter@ni.com>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc\@vger.kernel.org" 
        <linux-remoteproc@vger.kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel\@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
        <20200917194341.16272-6-ben.levinsky@xilinx.com>
        <20200917221120.GA15530@xaphan>
        <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
        <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
        <20200918160721.GD15530@xaphan>
        <BYAPR02MB44073FBEF86F4AA2379D8A11B53F0@BYAPR02MB4407.namprd02.prod.outlook.com>
        <20200918190643.GA172254@xaphan>
        <CAA07jV9WfTTLRwh3kmy1985p4C1m37wQJQAHzLdK2cn4f8HENw@mail.gmail.com>
        <BYAPR02MB4407AA5D63EBAC7BEC93CB62B53D0@BYAPR02MB4407.namprd02.prod.outlook.com>
Date:   Mon, 21 Sep 2020 19:04:51 +0900
In-Reply-To: <BYAPR02MB4407AA5D63EBAC7BEC93CB62B53D0@BYAPR02MB4407.namprd02.prod.outlook.com>
        (Ben Levinsky's message of "Sun, 20 Sep 2020 23:16:25 +0000")
X-TSB-HOP: ON
Message-ID: <87k0wnjvi4.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Ben Levinsky <BLEVINSK@xilinx.com> writes:

> Hi All,
>
>> -----Original Message-----
>> From: Wendy Liang <sunnyliangjy@gmail.com>
>> Sent: Friday, September 18, 2020 6:53 PM
>> To: Michael Auchter <michael.auchter@ni.com>
>> Cc: Ben Levinsky <BLEVINSK@xilinx.com>; punit1.agrawal@toshiba.co.jp;
>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>> Subject: Re: RE: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
>> remoteproc driver
>> 
>> HI Michael, Ben, Punit,
>> 
>> On Fri, Sep 18, 2020 at 12:08 PM Michael Auchter <michael.auchter@ni.com>
>> wrote:
>> >
>> > Hey Ben,
>> >
>> > On Fri, Sep 18, 2020 at 06:01:19PM +0000, Ben Levinsky wrote:
>> > > Hi Michael, Punit,
>> > >
>> > > > -----Original Message-----
>> > > > From: Michael Auchter <michael.auchter@ni.com>
>> > > > Sent: Friday, September 18, 2020 9:07 AM
>> > > > To: Ben Levinsky <BLEVINSK@xilinx.com>
>> > > > Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>> linux-
>> > > > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>> > > > Subject: Re: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
>> > > > remoteproc driver
>> > > >
>> > > > On Thu, Sep 17, 2020 at 10:50:42PM +0000, Ben Levinsky wrote:

[...]

>> > > A suggestion that might clean up the driver so that the whole
>> > > rpu_mode, tcm_mode configuration can be simplified and pulled out of
>> > > the driver:
>> > > - as Punit suggested, remove the lockstep-mode property
>> > > - the zynqmp_remoteproc_r5 driver ONLY loads firmware and does
>> start/stop.
>> > > - the zynqmp_remoteproc_r5 driver does not configure and memory
>> regions or the RPU. Let the Xilinx firmware sysfs interface handle this.
>> >
>> > I don't think this is a good approach.

> [Ben Levinsky] ok, noted. Can keep the configuration but still as
> wendy said just have lockstep property to denote lockstep mode in RPU
> and otherwise be split, for simplicity?

That would be a better approach than the current proposal.

>> [Wendy] The TCMs are presented differently in the system depending on
>> if RPU is in
>> lockstep or split mode.
>> 
>> Not sure if it is allowed to list TCMs registers properties for both
>> split mode and lockstep
>> mode in the same device node.
>> 
>> Even though, driver can have this information in the code, but I feel
>> the device tree is a
>> better place for this information.
>> And also for predefined shared memories, you will need to know the RPU
>> op mode ahead,
>> so that you can specify which shared memories belong to which RPU.
>> 
>> To dynamic setup the RPU mode, besides sysfs, setup, if remoteproc can
>> support
>> device tree overlay, the RPUs can be described with dtbo and loaded at
>> runtime.
>> 
>> Just want to understand the case which needs to set  RPU mode at runtime?
>> I think testing can be one case.
> [Ben Levinsky] for testing, so far it has been r50/1 split and r5
> lockstep

>> Best Regards,
>> Wendy
>> 
>> > - How will someone know to configure the RPU mode and TCM mode via
>> sysfs?
>> > - What happens when someone changes the RPU mode after remoteproc
>> has
>> >   already booted some firmware on it?
>> > - What if the kernel is the one booting the R5, not the user?
>> >
>> > Split vs. lockstep, IMO, needs to be specified as part of the device
>> > tree, and this driver needs to handle configuring the RPU mode and TCM
>> > modes appropriately.
>> >

Typically, the device tree is expected to describe the hardware to the
kernel rather than telling it what the hardware should look like. More
below.

> [Ben Levinsky] Ok, as Wendy suggested would instead the presence of a
> "lockstep=mode" property indicate lockstep mode and otherwise imply
> split mode?

>> > Split vs. lockstep already necessitates different entries in the device
>> > tree:
>> > - In the binding, each core references its TCMs via the
>> >   meta-memory-regions phandles, and the referenced nodes necessarily
>> >   encode this size. In split mode, each core has access to 64K of
>> >   TCMA/TCMB, while in lockstep R5 0 has access to 128K of TCMA/TCMB. So,
>> >   the "xlnx,tcm" nodes' reg entries need to differ between lockstep and
>> >   split.

But considering the dependency between split/lockstep mode and available
memory sizes as described here it maybe OK to have the firmware (via DT)
specify the configured mode. Though IMO it is overloading the device
tree functionality (not the first time) because that's the hammer we've
got.

Even in this scenario, ideally it would be the boot firmware's
responsibility to configure the RPU in the desired mode and communicate
the mode to the kernel. The driver can use the mode information to
verify that the system is in the expected state during probe and error
out if not.

Though taking this approach will not help the "testing" usecase
mentioned by Wendy.

>> > - In lockstep mode, it does not make sense to have both r5@0 and r5@1
>> >   child nodes: only r5@0 makes sense. Though, I just realized that I
>> >   think this driver will currently permit that, and register two
>> >   remoteprocs even in lockstep mode... What happens if someone tries to
>> >   load firmware on to r5_1 when they're in lockstep mode? This should
>> >   probably be prevented.
>> >

> [Ben Levinsky] Good Point. the loading of R5 1 while in lockstep is an
> uncovered corner case.. for this, before loading/starting or
> requesting memory the state of global rpu mode can be checked and this
> can act as a guard for probing a remoteproc instance for r5-1 if
> either is in lockstep and similar safeguard for firmware loading for
> R5-1 if in lockstep mode

IIUC, if the second R5 is not registered with remoteproc, it is not
possible to request loading firmware to it from userspace. So no special
case guards should be needed.

Thanks,
Punit

[...]

