Return-Path: <linux-arm-msm-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Nov 2019 12:28:29 +0000
From: sibis@codeaurora.org
Subject: Re: [PATCH 13/16] arm64: dts: qcom: msm8998: Update reserved memory
 map
In-Reply-To: <CAOCk7NogQY3Vjo+cL5_0anVO=K1LfTqG69b8AGi9HQsTMEsCug@mail.gmail.com>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e807915dc-5f8701fd-5c4a-45a5-a9ee-9e4d8700a3fa-000000@us-west-2.amazonses.com>
 <CAOCk7NogQY3Vjo+cL5_0anVO=K1LfTqG69b8AGi9HQsTMEsCug@mail.gmail.com>
Message-ID: <0101016e83a2b64f-7d9f9170-7720-4198-adae-7f39a846c432-000000@us-west-2.amazonses.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de, MSM <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, DTML <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Jeff,
Thanks for taking time to review
the series.

On 2019-11-19 03:34, Jeffrey Hugo wrote:
> On Mon, Nov 18, 2019 at 2:45 PM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Update existing and add missing regions to the reserved memory map, as
>> described in version 7.1
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 62 
>> ++++++++++++++++++++++++---
>>  1 file changed, 55 insertions(+), 7 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi 
>> b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index fc7838ea9a010..707673e3cf28a 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -28,8 +28,13 @@
>>                 #size-cells = <2>;
>>                 ranges;
>> 
>> -               memory@85800000 {
>> -                       reg = <0x0 0x85800000 0x0 0x800000>;
>> +               hyp_mem: memory@85800000 {
>> +                       reg = <0x0 0x85800000 0x0 0x600000>;
>> +                       no-map;
>> +               };
>> +
>> +               xbl_mem: memory@85e00000 {
> 
> Are we ever going to use this label?

just leaving it here for info with the
added benefit of being deleteable
if MSM8998 uses a different boot chain
where xbl_mem/tz_mem remains unused as
in the case of Cheza

> 
>> +                       reg = <0x0 0x85e00000 0x0 0x100000>;
>>                         no-map;
>>                 };
>> 
>> @@ -38,21 +43,64 @@
>>                         no-map;
>>                 };
>> 
>> -               memory@86200000 {
>> +               tz_mem: memory@86200000 {
> 
> Again, are we ever going to use this?

ditto

> 
>>                         reg = <0x0 0x86200000 0x0 0x2d00000>;
>>                         no-map;
>>                 };
>> 
>> -               rmtfs {
>> +               rmtfs_mem: memory@88f00000 {
>>                         compatible = "qcom,rmtfs-mem";
>> -
>> -                       size = <0x0 0x200000>;
>> -                       alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
>> +                       reg = <0x0 0x88f00000 0x0 0x200000>;
> 
> This seems to overlap with a defined region in the memory map.
> 0x9fa00000 seems to be a better address.

just following the what we did
for SDM845 SoC 0x88f00000 should
be safe to use.

> 
>>                         no-map;
>> 
>>                         qcom,client-id = <1>;
>>                         qcom,vmid = <15>;
>>                 };
>> +
>> +               spss_mem: memory@8ab00000 {
>> +                       reg = <0x0 0x8ab00000 0x0 0x700000>;
>> +                       no-map;
>> +               };
>> +
>> +               adsp_mem: memory@8b200000 {
>> +                       reg = <0x0 0x8b200000 0x0 0x1a00000>;
>> +                       no-map;
>> +               };
>> +
>> +               mpss_mem: memory@8cc00000 {
>> +                       reg = <0x0 0x8cc00000 0x0 0x7000000>;
>> +                       no-map;
>> +               };
>> +
>> +               venus_mem: memory@93c00000 {
>> +                       reg = <0x0 0x93c00000 0x0 0x500000>;
>> +                       no-map;
>> +               };
>> +
>> +               mba_mem: memory@94100000 {
>> +                       reg = <0x0 0x94100000 0x0 0x200000>;
>> +                       no-map;
>> +               };
>> +
>> +               slpi_mem: memory@94300000 {
>> +                       reg = <0x0 0x94300000 0x0 0xf00000>;
>> +                       no-map;
>> +               };
>> +
>> +               ipa_fw_mem: memory@95200000 {
>> +                       reg = <0x0 0x95200000 0x0 0x10000>;
>> +                       no-map;
>> +               };
>> +
>> +               ipa_gsi_mem: memory@95210000 {
>> +                       reg = <0x0 0x95210000 0x0 0x5000>;
>> +                       no-map;
>> +               };
>> +
>> +               gpu_mem: memory@95215000 {
>> +                       reg = <0x0 0x95215000 0x0 0x1000>;
> 
> This is the wrong size for the zap region.

double checked the memory maps,
gpu mem size is mentioned as 4kb
is that not the case?


> 
>> +                       no-map;
>> +               };
>>         };
>> 
>>         clocks {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
