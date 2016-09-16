Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 07/19] remoteproc: Add new resource type for resource
 table spare bytes
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-8-git-send-email-loic.pallardy@st.com>
 <20160915175432.GF21438@tuxbot>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <bb1b93f7-a06d-e173-50f9-cc6ba38a29f1@st.com>
Date: Fri, 16 Sep 2016 11:02:56 +0200
MIME-Version: 1.0
In-Reply-To: <20160915175432.GF21438@tuxbot>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/15/2016 07:54 PM, Bjorn Andersson wrote:
> On Wed 31 Aug 13:50 PDT 2016, Loic Pallardy wrote:
>
>> To allow resource appending to an existing resource table,
>> remoteproc framework should get information about resource
>> table spare area. With current resource table construction,
>> remoteproc is not able to identify by itself any free location.
>> This patch introduces a new resource type named RSC_SPARE which
>> allows firmware to define room for resource table extension.
>> Defined spare area will be used by remtoreproc to extend resource
>> table.
>>
>
> We don't need a dummy type for keeping track of the available room in
> the resource table in the loaded firmware. All we need to do is to look
> at the sh_size of the .resource_table section, which actually is what's
> returned in tablesz.
>
This is the size of the .resource_table section. Doesn't means that only 
resource table is stored in. Today this is the assumption and we force 
firmware to respect this.

> So the spare size is the difference between tablesz and the end of the
> last resource and if you need you can pad this when composing the
> firmware.
>
Proposal was to clearly identify the area for extension (whatever 
.resource_table section is done). But if you agree on the fact 
.resource_tabel section constains only resource table and eventualy room 
for extension, I can indeed simply room detection.

Regards,
Loic

> Regards,
> Bjorn
>
